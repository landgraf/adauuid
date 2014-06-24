with aunit; use aunit;
with Aunit.Simple_Test_Cases;
package adauuid.test_compare is 

    type TC is new Simple_Test_Cases.Test_Case with null record;


    overriding
    procedure Run_Test (T : in out TC); 

    overriding
    function Name (T : TC) return Message_String;
end adauuid.test_compare; 

