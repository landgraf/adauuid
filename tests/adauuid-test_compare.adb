with Ada.Text_IO; use Ada.Text_IO; 
with Aunit.Assertions;
package body adauuid.test_compare is 



    procedure Run_Test (T : in out TC) is 
        use Aunit.Assertions;
        U0 : UUID := Null_UUID;
        U1 : UUID; 
    begin
        Put_Line("Compare functions test...");
        Assert(Condition => U0 < U1, Message => "comparasion function test fauled");
    end Run_Test;

    function Name (T : TC) return Message_String is
        pragma Unreferenced(T);
    begin
        return Aunit.Format("Test case name : adauuid.compare adauuid.test"); 
    end Name;
end adauuid.test_compare; 

