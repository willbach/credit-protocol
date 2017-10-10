#!/bin/bash

if [ $# -eq 0 ]; then
    echo "runtest.sh <TEST_SCRIPT_FILE>"
    exit
fi

function cleanup {
    kill -9 $testrpc_pid
}

trap cleanup EXIT

testrpc -p 8546 -g 1000000000 --account="0x7231a774a538fce22a329729b03087de4cb4a1119494db1c10eae3bb491823e7, 5000000000000000000000000" --account="0xb217205550c6011141e3580142ac43d7d41d217102f30e816eb36b70727e292e, 5000000000000000000000001" --account="0xf581608ccd4dcd78e341e464b86f268b77ee2673acc705023e64eeb5a4e31490, 5000000000000000000000002" --account="0x024f55d169862624eec05be973a38f52ad252b3bcc0f0ed1927defa4ab4ea098, 5000000000000000000000003" --account="0x024f55d169862624eec05be973a38f52ad252b3bcc0f0ed1927defa4ab4ea099, 1000000000000000000000004" --account="0x024f55d169862624eec05be973a38f52ad252b3bcc0f0ed1927defa4ab4ea100, 1000000000000000000000005" --account="0x024f55d169862624eec05be973a38f52ad252b3bcc0f0ed1927defa4ab4ea101, 1000000000000000000000005" --account="0x024f55d169862624eec05be973a38f52ad252b3bcc0f0ed1927defa4ab4ea102, 1000000000000000000000005" --account="0x024f55d169862624eec05be973a38f52ad252b3bcc0f0ed1927defa4ab4ea103, 1000000000000000000000005" > /dev/null &
testrpc_pid=$!
echo "Started testrpc, pid ${testrpc_pid}"
truffle test --network testrpc test/$1
