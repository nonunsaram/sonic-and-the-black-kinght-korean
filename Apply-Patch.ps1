param([string]$BaseIso,[string]$OutputIso)
$ErrorActionPreference='Stop'
try {
 $manifest=Get-Content -LiteralPath (Join-Path $PSScriptRoot 'release.json') -Raw -Encoding UTF8 | ConvertFrom-Json
 if(-not $BaseIso) {
  Add-Type -AssemblyName System.Windows.Forms
  $picker=New-Object System.Windows.Forms.OpenFileDialog
  $picker.Title='원본 Sonic and the Black Knight USA ISO 선택'
  $picker.Filter='Wii ISO (*.iso)|*.iso'
  if($picker.ShowDialog() -ne 'OK'){exit 1}
  $BaseIso=$picker.FileName
 }
 $BaseIso=(Resolve-Path -LiteralPath $BaseIso).Path
 if(-not $OutputIso){$OutputIso=Join-Path (Split-Path $BaseIso -Parent) 'Sonic and the Black Knight KR v0.1 alpha.iso'}
 $OutputIso=[IO.Path]::GetFullPath($OutputIso)
 if([string]::Equals($BaseIso,$OutputIso,[StringComparison]::OrdinalIgnoreCase)){throw '원본을 출력으로 지정할 수 없습니다.'}
 if(Test-Path -LiteralPath $OutputIso){throw '출력 파일이 이미 있습니다. 다른 출력 파일명을 지정하세요.'}
 if((Get-Item -LiteralPath $BaseIso).Length -ne $manifest.base_size){throw '지원하지 않는 원본 크기입니다. RVZ/WBFS는 ISO로 변환하세요.'}
 Write-Host '원본과 패치 파일을 검사합니다...'
 if((Get-FileHash -LiteralPath $BaseIso -Algorithm SHA256).Hash.ToLowerInvariant() -ne $manifest.base_sha256){throw '원본 SHA-256이 다릅니다. USA RENE8P 지원 판본을 확인하세요.'}
 $patch=Join-Path $PSScriptRoot $manifest.patch_file
 $decoder=Join-Path $PSScriptRoot 'xdelta3.exe'
 if((Get-FileHash -LiteralPath $patch -Algorithm SHA256).Hash.ToLowerInvariant() -ne $manifest.patch_sha256){throw '패치 파일이 손상되었습니다.'}
 if((Get-FileHash -LiteralPath $decoder -Algorithm SHA256).Hash.ToLowerInvariant() -ne $manifest.xdelta_sha256){throw 'xdelta 실행 파일이 일치하지 않습니다.'}
 Write-Host '새 한국어 ISO를 만듭니다...'
 & $decoder -d -s $BaseIso $patch $OutputIso
 if($LASTEXITCODE -ne 0){throw '패치 적용 실패. 생성된 출력 파일은 사용하지 마세요.'}
 if((Get-FileHash -LiteralPath $OutputIso -Algorithm SHA256).Hash.ToLowerInvariant() -ne $manifest.patched_sha256){throw '결과 검사 실패. 생성된 출력 파일은 사용하지 마세요.'}
 Write-Host ('완료: '+$OutputIso)
 Write-Host '돌핀에서 새 ISO를 열고 게임 내 자막 언어를 한국어로 선택하세요.'
} catch { Write-Error $_; exit 1 }
