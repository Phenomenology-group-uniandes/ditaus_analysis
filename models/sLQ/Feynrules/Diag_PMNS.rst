(*************************************************)
(*                                               *)                                            
(*     The PMNS matrix is diagonal               *)
(*                                               *)                                            
(*************************************************)

M$Restrictions = {

            PMNS[i_,i_] -> 1,
            PMNS[i_?NumericQ, j_?NumericQ] :> 0 /; (i =!= j)

}