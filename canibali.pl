%we have 5 senarious

%Fifth : carry two cannibals
move([[ML,CL],[MR,CR],0],[[ML,NCL],[MR ,NCR],1]):-
NCL is CL-2,
NCR is CR+2,
CL >1.
move([[ML,CL],[MR,CR],1],[[ML,NCL],[MR ,NCR],0]):-
NCL is CL+2,
NCR is CR-2,
CR >1.

%Second : carry two missionaries
move([[ML,CL],[MR,CR],0],[[NML,CL],[NMR,CR],1]):-
NML is ML-2,
NMR is MR+2 ,
ML >1.

move([[ML,CL],[MR,CR],1],[[NML,CL],[NMR,CR],0]):-
NML is ML+2,
NMR is MR-2 ,
MR >1.


%First : carry one missionaries and one cannibals
move([[ML,CL],[MR,CR],0],[[NML,NCL],[NMR,NCR],1]):-
NML is ML-1,
NCL is CL-1,
NMR is MR+1 ,
NCR is CR+1,
ML >0,
CL >0.

%if i put if MR,CR < 3 it will be same with  condition ML ,Cl > 0.
move([[ML,CL],[MR,CR],1],[[NML,NCL],[NMR,NCR],0]):-
NML is ML+1,
NCL is CL+1,
NMR is MR-1 ,
NCR is CR-1,
MR >0,
CR >0.



%Third : carry one missionaries
move([[ML,CL],[MR,CR],0],[[NML,CL],[NMR ,CR],1]):-
NML is ML-1,
NMR is MR+1 ,
ML >0.

move([[ML,CL],[MR,CR],1],[[NML,CL],[NMR ,CR],0]):-
NML is ML+1,
NMR is MR-1 ,
MR >0. 

%Fourth : carry one cannibals
move([[ML,CL],[MR,CR],0],[[ML,NCL],[MR,NCR],1]):-
NCL is CL-1,
NCR is CR+1,
CL >0.

move([[ML,CL],[MR,CR],1],[[ML,NCL],[MR,NCR],0]):-
NCL is CL+1,
NCR is CR-1,
CR >0.


%If missionaries less than cannibals then will be eaten 
unsafe([[ML,CL],[MR,CR],_]):-
CL > ML ,
CR > MR ,
ML=\=0,
CL=\=0,
MR=\=0,
CR=\=0.

game(L,G):-
bank(L,[L],G),!.

bank([[0,0],[3,3],1],Visited,Visited).
bank(Current,Visited ,R):-
move(Current,Next),
\+ unsafe(Next),
\+ member(Next,Visited),
bank(Next,[Next|Visited],R),
write(Next).
