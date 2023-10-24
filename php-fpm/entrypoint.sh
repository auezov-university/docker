 #!/bin/bash

supervisor reread
 
supervisor update
 
supervisor start "app.local:*"