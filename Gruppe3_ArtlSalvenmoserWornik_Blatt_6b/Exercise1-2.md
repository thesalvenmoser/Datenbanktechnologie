# Data Import
## Differences between main table and its corresponding history.
The main table always contains the current entry. In the history table, however, the old entry is saved as a new entity each time the entity changes (INSERT, UPDATE, or DELETE). This means that the values of a specific entry's attributes can be reproduced after the changes have taken effect.