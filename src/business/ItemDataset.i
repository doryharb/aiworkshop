/* Define temp-table for Item */
DEFINE TEMP-TABLE ttItem BEFORE-TABLE bttItem
    FIELD ItemNum  AS INTEGER LABEL "Item Num"
    FIELD Price    AS DECIMAL LABEL "Price"
    FIELD OnHand   AS INTEGER LABEL "On Hand"
    FIELD ItemName AS CHARACTER LABEL "Item Name".

/* Define dataset for Item */
DEFINE DATASET dsItem FOR ttItem.
