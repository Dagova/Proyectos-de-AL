table 50410 "Sales Discount Request"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Customer No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Sales Document No."; code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(4; "Sales Document Type"; enum "Sales Document Type")
        {
            DataClassification = ToBeClassified;
        }
        field(5; Status; Enum "Sales Discount Status")

        {
            DataClassification = ToBeClassified;
            InitValue = 0; // Draft
        }
        field(6; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}