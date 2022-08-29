$tmpScript = "./tmp_release_script.nsi"
# ���뷢��
dotnet clean
dotnet restore
dotnet publish -p:PublishProfile=FolderProfile

# ��ȡ�汾��
$xml_data = [xml](Get-Content ./HuoHuan/HuoHuan.csproj)
$version =  $xml_data.Project.PropertyGroup.Version
"�汾�ţ� $version"

# ������ʱNSIS�ű��ļ�
$original_txt = (Get-Content ./release_script.nsi)
New-Item $tmpScript -type file
Set-Content $tmpScript $original_txt
(Get-Content $tmpScript) -Replace '#replace_version#', $version | Set-Content $tmpScript

# ��Ҫ��NSIS�ű���װ·�����õ�����������
makensis $tmpScript

# ɾ��NSIS��ʱ�ļ�
Remove-Item $tmpScript