#!/bin/bash

curl -s -O https://raw.githubusercontent.com/robperc/FinderSidebarEditor/master/FinderSidebarEditor.py

pip3 install pyobjc

python3 -c "
from FinderSidebarEditor import FinderSidebar
sidebar = FinderSidebar()
sidebar.remove('All My Files')
sidebar.remove('Documents')
sidebar.remove('myDocuments.cannedSearch')
sidebar.add('$HOME')
"

rm -rf FinderSidebarEditor.py*
