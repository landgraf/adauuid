with Interfaces.C; 
package adauuid is 
    type UUID is tagged private;
    subtype UUID_String is String(1..36);
    null_uuid : constant UUID_String := (others => '0');
    type UUID_Bin is array (1..16) of Interfaces.C.unsigned_char; 
    type Letter_Case is (None, Upper, Lower); 

    function To_String(U : in out UUID) return UUID_String;

    procedure From_String(U : out UUID; Str : in String)
        with Pre => Str'Length <= UUID_String'Length; 

    function Is_Null(Self : in UUID) return Boolean;

    procedure Parse(U : in out UUID; Translate : in Letter_Case := Upper)
        with Post => U.To_String /= null_uuid; 

    procedure Clear(U : in out UUID); 
    function "="(U1 : in UUID; U2 : in UUID) return Boolean;
    procedure Copy(Src : in UUID; Dst : out UUID);
    
    
    private
    function Generate return UUID_Bin;
    type UUID is tagged record
        Str : UUID_String := (others => '0');
        Bin : UUID_Bin := Generate; 
    end record;
end adauuid; 

