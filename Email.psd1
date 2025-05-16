@{
    RootModule        = 'Email.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = 'a1111a11-1111-1111-1111-111111111111'
    Author            = 'GVBYTE'
    Description       = 'GVBYTE custom Email classes and functions'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Send-Email','Send-EmailPrompt','Send-EmailHTML','Send-EmailTestPrompt')
}