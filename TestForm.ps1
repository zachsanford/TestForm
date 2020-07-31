Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function testFunction {

    Param (
        [Parameter(Mandatory=$true, Position=1)]
        [string] $IPv4
    )

    $label.Text = Test-Connection $IPv4

}

$form = New-Object System.Windows.Forms.Form
$form.Text = 'This is a test form'
$form.Size = New-Object System.Drawing.Size(500,500)
$form.StartPosition = 'CenterScreen'

# Label
$label = New-Object System.Windows.Forms.Label
$label.Text = 'Please enter something'
$label.Location = New-Object System.Drawing.Point(75,120)
$label.Size = New-Object System.Drawing.Size(280,20)
$form.Controls.Add($label)

# textbox
$textbox = New-Object System.Windows.Forms.Textbox
$textbox.Location = New-Object System.Drawing.Point(10,40)
$textbox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textbox)

# result label
$rLabel = New-Object System.Windows.Forms.Label
$rLabel.Location = New-Object System.Drawing.Point(10,20)
$rLabel.Size = New-Object System.Drawing.Size(260,20)
$rLabel.Text = 'Ready'
$form.Controls.Add($rLabel)

# button
$button = New-Object System.Windows.Forms.Button
$button.Text = 'Enter'
$button.Location = New-Object System.Drawing.Point(75,140)
$button.Size = New-Object System.Drawing.Size(75,23)
$form.Controls.Add($button)

# button click event
$button.Add_Click({
    while($true) {
        $rLabel.Text = 'Running...'
        testFunction $textbox.Text
        break
    }
    $rLabel.Text = 'Done!'
})

$form.Topmost = $true
$form.ShowDialog()