Function Set-ADPicture {
	[CmdletBinding()]
	Param(
		[Parameter(ValueFromPipelineByPropertyName=$true)]
		[ValidateNotNullOrEmpty()]
		[Alias("BaseName")]
		[string] $User,
		
		[Parameter(ValueFromPipelineByPropertyName=$true)]
		[Alias("FullName")]
		[string] $PicturePath = ""
	)

	begin {
		if (!(Get-Module ActiveDirectory)) {
			Import-Module ActiveDirectory
		}
	}
	process {
		if ($PicturePath -ne "") {
			[byte[]] $bytes = [System.IO.File]::ReadAllBytes($PicturePath)
			Set-ADUser $User -Replace @{thumbnailPhoto = $bytes}
		} else {
			Set-ADUser $User -Clear "thumbnailPhoto"
		}
	}
	end {
		
	}
}
