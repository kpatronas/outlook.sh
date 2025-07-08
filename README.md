# outlook.sh

Automate creating Outlook email drafts on macOS from the Terminal.  
Supports piping body text via stdin and attaching multiple files with absolute or relative paths.

---

## ✨ Features

- ✅ Create new Outlook email drafts from your Terminal
- ✅ Use piped stdin as the email body
- ✅ Attach one or more files
- ✅ Automatically resolves relative paths
- ✅ Simple Bash + AppleScript solution, no dependencies

---

## 🛠️ Installation

Download the script and make it executable:

```bash
chmod +x ./outlook.sh
```

## Examples

Create an email with body text only
Pipe any text to become the email body:

```bash
echo "Hello team, please see the update below." | ./outlook.sh
```

Create an email with attachments only

```bash
./outlook.sh ./report.pdf ./metrics.xlsx
```

Combine body text and attachments
Send both body text and files:

```bash
echo "Hi all, attached are the reports for this week." | ./outlook.sh ./weekly.pdf ./summary.csv
```


