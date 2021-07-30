# Import Active Directory module
Import-Module ActiveDirectory
# Prompt to add file path of the CSV file
$filepath = Read-Host -Prompt “Enter file path of the CSV file” 
# Import CSV file into a variable
$CSV = Import-Csv $filepath
# Loop through every line in the CSV file to get first and last names of users 
ForEach ($user in $CSV) {
	$Firstname = $user.Firstname
	$Lastname = $user.Lastname
    # Concatenate first 4 letters of Firstname and the last four of Lastname in lowercase to create username for the users
    $username = ($Firstname[0..3] + $Lastname[-4..-1] -join “”).tolower() 
    # Randomly Select Department for each user
    $Dept = “IT”, “Finance”, “Logistics”, “HR” | Get-Random
    # Create email for each student in the format: username@bigcorp.co.uk
    $email = $username +”@bigcorp.co.uk”
    #Put Password1 in a variable
    $Password = ConvertTo-SecureString “Password1” -AsPlainText -Force
    # Put Organization unit path in a variable
    $OUpath = “OU=TestUsers,DC=bigcorp,DC=co,DC=uk”
    # Import users into Active Directory with the required information
    New-ADUser `
        -Name “$Firstname $Lastname” `
        -GivenName $Firstname `
        -Surname $Lastname `
        -SamAccountName $username `
        -Department $Dept `
        -EmailAddress $email `
        -AccountPassword $Password `
        -Path $OUpath `
        -Enabled $True
   }
