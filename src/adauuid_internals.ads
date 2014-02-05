with Interfaces.C; 
with adauuid; use adauuid;
package adauuid_internals is 
    procedure uuid_generate_random( U : out UUID_Bin) with Import, Convention => C; 
    function uuid_compare(U1 : in UUID_Bin; U2 : in UUID_Bin) return Interfaces.C.Int with Import, Convention => C;
    procedure uuid_unparse_upper(U : in UUID_Bin; Str : out UUID) with Import, Convention => C;
    procedure uuid_unparse_lower(U : in UUID_Bin; Str : out UUID) with Import, Convention => C;
    procedure uuid_unparse(U : in UUID_Bin; Str : out UUID) with Import, Convention => C;
    procedure uuid_parse(Str : in UUID; U : out UUID_Bin) with Import, Convention => C; 
    function uuid_is_null ( U : in UUID_Bin) return Interfaces.C.Int with Import, Convention => C; 
    procedure uuid_clear ( U : in out UUID_Bin) with Import, Convention => C;
    procedure uuid_copy (Dst : out UUID_Bin; Src : in UUID_Bin) with Import, Convention =>C;  

end adauuid_internals; 

