with Interfaces.C; 
package adauuid is 
    type UUID is tagged private;
    subtype UUID_String is String(1..36);
    null_uuid : constant UUID_String := (others => '0');
    type UUID_Bin is array (1..16) of Interfaces.C.unsigned_char; 
    type Letter_Case is (None, Upper, Lower); 

    function To_String(U : in out UUID) return String 
        with Post => To_String'Result'Length = 36; 

    function Bin(U : in out UUID) return UUID_Bin; 

    function From_String(Str : in String) return UUID
        with Pre => Str'Length = 36;

    function Is_Null(Self : in UUID) return Boolean;

    procedure Clear(U : in out UUID); 
    function "="(U1 : in UUID; U2 : in UUID) return Boolean;
    procedure Copy(Src : in UUID; Dst : out UUID);
    
    
    private
    function Generate return UUID_Bin;
    type UUID is tagged record
        Bin : UUID_Bin := Generate; 
    end record;
end adauuid; 

