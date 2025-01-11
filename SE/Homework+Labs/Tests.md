|   |   |
|---|---|
|**The tested requirement**|the torpedoes of GT4500 can be fired|
|**Preconditions (initial state)**|there is at least 1 torpedo on board|
|**The steps of the test**|we fire one torpedo (e.g. `TORPEDO,SINGLE`)|
|**The expected output/result**|the result of the second command is `SUCCESS`|

|   |   |
|---|---|
|**The tested requirement**          |the torpedoes of GT4500 all are fired |
|**Preconditions (initial state)**   |there are 2 torpedo on each      |
|**The steps of the test**           |we fire one torpedo (e.g. `TORPEDO,ALL`)   |
|**The expected output/result**      |the result of the second command is `SUCCESS`|

|   |   |
|---|---|
|**The tested requirement**          |the torpedoes of GT4500 all are fired but you have 1 torpedo |
|**Preconditions (initial state)**   |there are 1 torpedo on board       |
|**The steps of the test**           |we fire one torpedo (e.g. `TORPEDO,ALL`)   |
|**The expected output/result**      |the result of the second command is `SUCCESS`|

|   |   |
|---|---|
|**The tested requirement**          |the GT4500 switches the primary and secondary until is empty|
|**Preconditions (initial state)**   |there are 5 in each one torpedo on board       |
|**The steps of the test**           |we fire one torpedo (e.g. `TORPEDO,ALL`) several times |
|**The expected output/result**      |the result of the second command is `SUCCESS` for all of them until the last one where it should be a `FAIL` |


|   |   |
|---|---|
|**The tested requirement**          |If one place is empty does the other fire|
|**Preconditions (initial state)**   |there are 5 torpedos only in the first recoil      |
|**The steps of the test**           |we fire one torpedo (e.g. `TORPEDO,SINGLE` ) seveal time|
|**The expected output/result**      |the result of the second command is `SUCCESS`|

