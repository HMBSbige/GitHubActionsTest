param(
	[System.Version]$current_version,
	[System.Version]$latest_version
)
$ErrorActionPreference = "Stop"

if ($current_version -ge $latest_version) {
	exit 0
}

function Send-TelegramMessage {
	param($message)
	$url = 'https://api.telegram.org/bot' + $TELEGRAM_BOT_APITOKEN + '/sendMessage'
	$body = "chat_id=$TELEGRAM_BOT_CHATID&text=$message&parse_mode=MarkdownV2&disable_web_page_preview=true"
	Invoke-WebRequest $url -Method 'POST' -Body $body -ContentType "application/x-www-form-urlencoded; charset=utf-8"
}

$message = @"
[$NAME]($URI)
新版本：$latest_version
"@
$message = $message.replace('.', '\.')

Send-TelegramMessage $message
