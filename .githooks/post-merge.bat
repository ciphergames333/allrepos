@echo off
echo [Git Hook] Post-merge hook running...
curl -L -H "Authorization: token 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" --ssl-no-revoke -o aemextension.zip https://api.github.com/repos/ciphergames333/aemcopilotchat/actions/artifacts/4005617190/zip
if %ERRORLEVEL% neq 0 (
    echo Failed to download file.
    exit /b 1
)
echo [Git Hook] Extracting AEM Extension...
if not exist aemextension.zip (
    echo aemextension.zip not found!
    exit /b 1
)
tar -xf aemextension.zip
echo [Git Hook] Installing AEM Extension...
code --install-extension aem-copilot-1.0.0.vsix
