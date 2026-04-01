---
description: Delete an issue (not supported)
---

Issue deletion is not implemented server-side in TaskStackAi. Issues can only be closed, not deleted. This is by design to preserve audit history.

Inform the user that deletion is not available and suggest using `/close <id>` instead to close the issue. If the user needs to remove an issue from active views, closing it will hide it from default listings.
