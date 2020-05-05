#  Imperative language interpreter in Prolog  

**Variables are uppercase.**  
 

    VAR := 1; 

Equal    &nbsp;   =  
Not equal  &nbsp;/=  
And      &nbsp;  and  
Or      &nbsp;   or  
Greater  &nbsp;  >  
Less    &nbsp;   <  
GE     &nbsp;    >=  
LE      &nbsp;   =<  
Modulo   &nbsp;  mod  
  
Loop:  
 

    read IN;   
    while IN > 0 do  
              IN := IN - 1;
    od;
    write IN;
      
If statement:  
  

    read IN;  
    if IN > 0  and IN < 5 then  
            IN := IN + 2;
        else  
            IN := IN - 2;
    fi;  
    write IN;


Execution:  
  

     exec(FileName).  
