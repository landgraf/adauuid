with Aunit.Test_Suites; use Aunit.Test_Suites; 
with adauuid.test_generate; 
with adauuid.test_clear; 
with adauuid.test_copy;
with adauuid.test_strings; 
with adauuid.test_compare;
function adauuid_suite return Access_Test_Suite is 
    TS_Ptr : constant Access_Test_Suite := new Test_Suite; 
begin
    TS_Ptr.Add_Test (new adauuid.test_generate.TC); 
    TS_Ptr.Add_Test (new adauuid.test_clear.TC); 
    TS_Ptr.Add_Test (new adauuid.test_copy.TC); 
    TS_Ptr.Add_Test (new adauuid.test_strings.TC); 
    TS_Ptr.Add_Test (new adauuid.test_compare.TC); 
    return TS_Ptr;
end adauuid_suite; 

