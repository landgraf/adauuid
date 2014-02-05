with aunit; use aunit;
with Aunit.Simple_Test_Cases;
package adauuid.test_strings is 

    type TC is new Simple_Test_Cases.Test_Case with record
        U1, U2 : UUID;
    end record;


    overriding
    procedure Set_Up (T : in out TC); 

    overriding
    procedure Tear_Down (T : in out TC); 

    overriding
    procedure Run_Test (T : in out TC); 

    overriding
    function Name (T : TC) return Message_String;
end adauuid.test_strings; 

