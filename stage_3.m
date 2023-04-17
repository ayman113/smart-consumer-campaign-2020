clear all, clear, clc
format short 
%%%%%  10/jan/2021  %%%%%
%%%%%  made by: Ayman Abdalla  %%%%%
%greetings and explaination
menu('WELCOME TO CARBONFOOTPRINT CALCULATOR','next');
menu('Here You Can Calculate Your Carbon Emission Of Different Products By Simple Steps', 'next');
i=1;
strt=1;
% defining veriable that i will use in display part (added after ive done input part)
prod_1_type=0;
prod_1=0;
prod_2=0;
prod_3=0;
prod_4=0;
food_co2=0;
food_PR=0;
food_a=0;
baverage_co2=0;
baverage_PR=0;
baverage_a=0;
cloth_co2=0;
cloth_PR=0;
cloth_a=0;
other_co2=0;
other_PR=0;
other_a=0;
fr_type=0;
fr_co2=0;
pack_co2=0;
trans_co2=0;
trans_a=0;
fr_a=0;
%DESIRED CALCULATED OUTPUTS
PRODUCT=[0];
PRODUCT=string(PRODUCT);
AMOUNT=0;
CO2_AMOUNT=0;
PRICE=0;
MODE=0;
MODE=string(MODE);
DISTANCE=0;
CO2_PACK=0;
CO2_DISTANCE=0;
CO2=0;
PACK_TYPE=[0];
PACK_TYPE=string(PACK_TYPE);
TRANS_TYPE=[0];
TRANS_TYPE=string(TRANS_TYPE);
%%%%%%%%%%%%% input and calculations part $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
while strt==1
    b=1;
    
    %the 4 categories selction and calculation
    x=(['product number ', num2str(i)]);
    menu(x, 'next');
    %%%%%%%%%%%%%%%%% firstly, calculations for amounts %%%%%%%%%%%%%%%%
    while b<=1
        c=1;
        CAT=menu('firstly, choose the product category','food', 'beverages', 'clothes'  ,'other materials');
        switch CAT
            %food calculation
            case 1
                
                %types of food
                
                while c<=1
                    prod_1_type(i)=menu('please select your food category :','meat and seafood','Vegetables','Oil','Processed food', 'back');
                    if  prod_1_type(i)==5
                        c=2;
                        continue ;
                    end
                    switch prod_1_type(i)
                        %food type 1
                        case 1
                            
                            prod_1(i)=menu('please select your product :','beef','fish','lamb & mutton','pork','chicken','prawns','eggs', 'back');
                            
                            if  prod_1(i)==8
                                continue;
                            end
                            %food type 2
                        case 2
                            
                            prod_1(i)=menu('please select your product :','cabbage','onions','peas','potatoes','carrot','tomatoes','cassava','mushroom','corn','broccoli','cucumber','back');
                            if prod_1(i)==12
                                continue;
                            end
                            %food type 3
                        case 3
                            
                            prod_1(i)=menu('please select your product :','olive oil','palm oil','rapessed oil','sunflower oil','back');
                            if prod_1(i)==5
                                continue;
                            end
                            %food type 4
                        case 4
                            
                            prod_1(i)=menu('please select your product :','pizza','baked beans','sausages','dumplings','chicken pie','liver&bacon','steak','baked potatoes','back');
                            if prod_1(i)==9
                                continue;
                            end
                    end
                    
                    c=2;
                end
                if  prod_1_type(i)==5
                    
                    continue ;
                end
                %make the user enter the amount of food (food_a)
                title={'Enter the amount in kg'};
                dglt='amount';
                numm=1;
                def={''};
                fooda(1, i)=inputdlg(title,dglt,numm,def);
                %changing the input from cell to array
                x=cell2mat(fooda(1,i));
                x=str2num(x);
                food_a(1,i)=x;
                % calculate food co2 emissions
                EF_FOOD=[60 5 24 7 5.8 12 4.5 0 0 0 0; 0.35 0.32 0.9 0.8 0.4 1.4 1 0.48 1 2 1.37;6 8 3.09 4.2 0 0 0 0 0 0 0;4.4 1.5 4.6 14 4.2 12.5 11.3 2.2 0 0 0 ];
                food_co2(i)=EF_FOOD(prod_1_type(i) ,prod_1(i) )*food_a(i);
                % calculate food price
                PR_FOOD=[29.28 24 41.99 32 5.99 30.9 35 0 0 0 0; 4.1 4.06 7 3.51 4.46 4.72 10.6 27.5 8.6 12 3.11 ; 21.1 6.19 15.7 10.8 0 0 0 0 0 0 0;38.46 5.65 18 26 28 49 18.12 7 0 0 0];
                food_PR(i)=PR_FOOD(prod_1_type(i) ,prod_1(i) )*food_a(i);
                
                %baverage calculation
            case 2
                
                %type of baverage
                prod_2(i)=menu('please select your product ','Coffee(Nescafe)','EcoShape bottle of water','Coffee','Milk','Soymilk','Peppermint tea','Yogurt','Golden Syrup','Coca-Cola','Bonafont plain water','back');
                if prod_2(i)==11
                    continue;
                end
                %make the user enter the amount of baverage (baverage_a)
                title={'Enter the amount in kg'};
                dglt='amount';
                numm=1;
                def={''};
                baveragea(1, i)=inputdlg(title,dglt,numm,def);
                %changing the input from cell to array
                x=cell2mat(baveragea(1,i));
                x=str2num(x);
                baverage_a(1,i)=x;
                
                
                %baverage co2 emissions
                EF_BAVERAGES =[0.3200    0.2600   17.0000    3.0000    0.9000   10.2100    2.2800    2.0100    0.1400    0.1500];
                baverage_co2(i)=EF_BAVERAGES(prod_2(i))*baverage_a(i);
                % calculate baverage price
                PR_BAVERAGE=[1.74 1.74 12.2 5.9 9 2.29 8.19 9 11.9 4.4 ];
                baverage_PR(i)=PR_BAVERAGE(prod_2(i))*baverage_a(i);
                
                %cloth calculation
            case 3
                
                %type of cloth
                prod_3(i)=menu('please select your product :','Nylon','Cotton','Polyester','Wool', 'back');
                if prod_3(i)==5
                    continue;
                end
                %make the user enter the amount of cloth (cloth_a)
                title={'Enter the amount in kg'};
                dglt='amount';
                numm=1;
                def={''};
                clotha(1, i)=inputdlg(title,dglt,numm,def);
                %changing the input from cell to array
                x=cell2mat(clotha(1,i));
                x=str2num(x);
                cloth_a(1,i)=x;
                
                
                %cloth co2 emissons
                EF_CLOTH=[37 8 19 7];
                cloth_co2(i)=EF_CLOTH(prod_3(i))*cloth_a(i);
                % calculate baverage price
                PR_CLOTH=[95 8.9 24 17.9 ];
                cloth_PR(i)=PR_CLOTH(prod_3(i))*cloth_a(i);
                
                %other material calculation
            case 4
                
                %type of material
                prod_4(i)=menu('please select your product :','A4 paper','Paperboard','Paint','Carpet','Books','Glass','Cement','Steel','Cast iron pipe','Steel pipe','Reinforced concrete pipe','back');
                if prod_4(i)==12
                    continue;
                end
                %make the user enter the amount of other (other_a)
                title={'Enter the amount in kg'};
                dglt='amount';
                numm=1;
                def={''};
                othera(1, i)=inputdlg(title,dglt,numm,def);
                %changing the input from cell to array
                x=cell2mat(othera(1,i));
                x=str2num(x);
                other_a(1,i)=x;
                
                
                %other co2 emission
                EF_other=[3.37 1.29 2.91 3.9 0.956 0.895 0.405 2.196 3.096 3.096 0.095];
                other_co2(i)=EF_other(prod_4(i))*other_a(i);
                % calculate baverage price
                PR_other=[7.50 5.80 38.00 19.80 2.19 200.12 0.85 37.00 14.00 17.10 0.34];
                other_PR(i)=PR_other(prod_4(i))*other_a(i);
        end
        b=2;
    end
    %%%%%%%%%% secondly, calculations for purchase methods%%%%%%%%%%%%%%%%
    menu('Secondly, calculations for methods of purchase','next');
    d=1;
    %disp puchase method
    while d<=1
        e=1;
        M_CAT(i)=menu('How Did You Buy The Product ?','online', 'in store');
        switch M_CAT(i)
            
            case 1 %online mood
                
                
                while e<=1 %packaging type
                    
                    pack_type(i)=menu('please enter the packaging type :','Aluminium','Cardboard (including corrugate and carbon board)','Wrapping papers','Liquid Beverage cartoons','Glass','PE Bags / Film','PET Bottles','PET Rigids','HDPE Bottles','HDPE Rigids (Boxes/Crates)','PP Rigids (Boxes/Crates)','PP Film / Bags','HIPS Rigids (Yoghurt/Pots)','Other Plastics','Average Plastics','Steel','Wood', 'back');
                    if  pack_type(i)==18
                        e=2;
                        continue ;
                    end
                    f=1;
                    while f<=1 %shipping method
                        fr_type(i)=menu(' your package is shipped by :','air frieght','sea frieght','rail frieght','road frieght', 'back');
                        if  fr_type(i)==5
                            f=2;
                            continue ;
                        end
                        f=2;
                    end
                    if  fr_type(i)==5
                        continue ;
                    end
                    e=2;
                end
                if  pack_type(i)==18
                    continue ;
                end
                %make the user enter the distance (fr_a)
                title={'Enter the shipping distance in km : '};
                dglt='distance';
                numm=1;
                def={''};
                fra(1, i)=inputdlg(title,dglt,numm,def);
                %changing the input from cell to array
                x=cell2mat(fra(1,i));
                x=str2num(x);
                fr_a(1,i)=x;
                % calculate online shipping co2 emissions
                EF_FR=[258.75 0.425 2.1 0.0166];
                fr_co2(i)=EF_FR(fr_type(i))*fr_a(i);
                
                
                % calculate packaging co2 emissions
                EF_PACK=[0.68 1.04 1.0 22.11 0.75 2.7 4.19 4.06 2.66 3.19 3.64 2.69 5.13 3.47 3.07 1.87 0.43];
                pack_co2(i)=EF_PACK(pack_type(i)); %ASSUMPTION : (EACH PACKAGING WHEIGHT 1 KG)
                
                
            case 2 %in store method
                j=1;
                while j<=1 %transportation type
                    h=1;
                    trans_type(i)=menu('How Did You Go To The Store :','Passenger Car','Light Goods Vehicle','Heavy Duty Vehicle','Bus','walking', 'back');
                    if  trans_type(i)==6
                        j=2;
                        continue ;
                    elseif trans_type(i)~=5
                        while h<=1
                            fuel_type(i)=menu('what type of fuel you used :','Jet Fuel','Aviation Gasoline ','Gasoline/Petrol','Diesel Fuel','Residual Fuel Oil (3s 5 and 6)','LPG','LNG','Ethonal','100% Biodiesel','E85 Ethanol','B20 Biodisel', 'back');
                            
                            if fuel_type(i)==12
                                h=2;
                                continue;
                            end
                            h=2;
                        end
                        if fuel_type(i)==12
                            continue;
                        end
                    elseif trans_type(i)==5
                        fuel_type(i)=8;
                    end
                    
                    %make the user enter the distance (trans_a)
                    title={'what is the distance to the store : '};
                    dglt='distance';
                    numm=1;
                    def={''};
                    transa(1, i)=inputdlg(title,dglt,numm,def);
                    %changing the input from cell to array
                    x=cell2mat(transa(1,i));
                    x=str2num(x);
                    trans_a(1,i)=x;
                    
                    % calculate trans co2 emissions
                    TRANS_CON=[0.302 0.1452 0.2673 0.06357 0];
                    EF_FUEL=[2.522 2.212 2.302 2.641 2.530 1.490 1.227 0.000 0.000 0.345 2.113 ];
                    trans_co2(i)=TRANS_CON(trans_type(i))*EF_FUEL(fuel_type(i))*trans_a(i);
                    
                    j=2;
                end
                if  trans_type(i)==6
                    j=2;
                    continue ;
                end
        end
        d=2;
    end
    i=i+1;
    strt=menu('do you want to continue ? ','yes','no');
end
i=i-1;
%%%%%%%%%%%%% output and display part  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

%%%%%%% PRODUCT DISPLAY CALCULATIONS %%%%%%%%%
l_p1t=length(prod_1_type);
l_p1=length(prod_1);
l_p2=length(prod_2);
l_p3=length(prod_3); % % % finding max lenght
l_p4=length(prod_4);
l=max([l_p1t l_p1 l_p2 l_p3 l_p4]);
prod_1_type=([prod_1_type zeros(1,l-l_p1t)]);
prod_1=([prod_1 zeros(1,l-l_p1)]);
prod_2=([prod_2 zeros(1,l-l_p2)]); % % % making all arrays same size
prod_3=([prod_3 zeros(1,l-l_p3)]);
prod_4=([prod_4 zeros(1,l-l_p4)]);
% making all arrays strings
prod_1_type=string(prod_1_type);
prod_1=string(prod_1);
prod_2=string(prod_2);
prod_3=string(prod_3);
prod_4=string(prod_4);
%change numbers to product name
for n=1:i
    
    if prod_1_type(n)~='0' && prod_1_type(n)~='5'
        
        switch prod_1_type(n)
            
            case '1'
                if prod_1(n)~='0' && prod_1(n)~='8'
                    switch prod_1(n)
                        case '1'
                            PRODUCT(n)=['beef'];
                        case '2'
                            PRODUCT(n)=['fish'];
                        case '3'
                            PRODUCT(n)=['lamb & mutton'];
                        case '4'
                            PRODUCT(n)=['pork'];
                        case '5'
                            PRODUCT(n)=['chicken'];
                        case '6'
                            PRODUCT(n)=['prawns'];
                        case '7'
                            PRODUCT(n)=['eggs'];
                            
                    end
                    
                end
            case '2'
                if prod_1(n)~='0' && prod_1(n)~='12'
                    switch prod_1(n)
                        case '1'
                            PRODUCT(n)=['cabbage'];
                        case '2'
                            PRODUCT(n)=['onions'];
                        case '3'
                            PRODUCT(n)=['peas'];
                        case '4'
                            PRODUCT(n)=['potatoes'];
                        case '5'
                            PRODUCT(n)=['carrot'];
                        case '6'
                            PRODUCT(n)=['tomatoes'];
                        case '7'
                            PRODUCT(n)=['cassava'];
                        case '8'
                            PRODUCT(n)=['mushroom'];
                        case '9'
                            PRODUCT(n)=['corn'];
                        case '10'
                            PRODUCT(n)=['broccoli'];
                        case '11'
                            PRODUCT(n)=['cucumber'];
                    end
                end
            case '3'
                if prod_1(n)~='0' && prod_1(n)~='5'
                    switch prod_1(n)
                        case '1'
                            PRODUCT(n)=['olive oil'];
                        case '2'
                            PRODUCT(n)=['palm oil'];
                        case '3'
                            PRODUCT(n)=['rapessed oil'];
                        case '4'
                            PRODUCT(n)=['sunflower oil'];
                            
                    end
                end
            case '4'
                if prod_1(n)~='0' && prod_1(n)~='9'
                    switch prod_1(n)
                        case'1'
                            PRODUCT(n)=['pizza'];
                        case '2'
                            PRODUCT(n)=['baked beans'];
                        case '3'
                            PRODUCT(n)=['sausages'];
                        case '4'
                            PRODUCT(n)=['dumplings'];
                        case '5'
                            PRODUCT(n)=['chicken pie'];
                        case '6'
                            PRODUCT(n)=['liver&bacon'];
                        case '7'
                            PRODUCT(n)=['steak'];
                        case '8'
                            PRODUCT(n)=['baked potatoes'];
                            
                    end
                end
                l_food=length(food_a);
        end
    end
    
    
    if prod_2(n)~='0' && prod_2(n)~='11'
        switch prod_2(n)
            case '1'
                PRODUCT(n)=['Coffee(Nescafe)'];
            case '2'
                PRODUCT(n)=['EcoShape bottle of water'];
            case '3'
                PRODUCT(n)=['Coffee'];
            case '4'
                PRODUCT(n)=['Milk'];
            case '5'
                PRODUCT(n)=['Soymilk'];
            case '6'
                PRODUCT(n)=['Peppermint tea'];
            case '7'
                PRODUCT(n)=['Yogurt'];
            case '8'
                PRODUCT(n)=['Golden Syrup'];
            case '9'
                PRODUCT(n)=['Coca-Cola'];
            case '10'
                PRODUCT(n)=['Bonafont plain water'];
        end
    end
    
    
    
    if prod_3(n)~='0' && prod_3(n)~='5'
        switch prod_3(n)
            case '1'
                PRODUCT(n)=['Nylon'];
            case '2'
                PRODUCT(n)=['Cotton'];
            case '3'
                PRODUCT(n)=['Polyester'];
            case '4'
                PRODUCT(n)=['Wool'];
        end
    end
    
    
    
    if prod_4(n)~='0' && prod_4(n)~='12'
        switch prod_4(n)
            case '1'
                PRODUCT(n)=['A4 paper'];
            case '2'
                PRODUCT(n)=['Paperboard'];
            case '3'
                PRODUCT(n)=['Paint'];
            case '4'
                PRODUCT(n)=['Carpet'];
            case '5'
                PRODUCT(n)=['Books'];
            case '6'
                PRODUCT(n)=['Glass'];
            case '7'
                PRODUCT(n)=['Cement'];
            case '8'
                PRODUCT{n}=['Steel'];
            case '9'
                PRODUCT(n)=['Cast iron pipe'];
            case '10'
                PRODUCT(n)=['Steel pipe'];
            case '11'
                PRODUCT(n)=['Reinforced concrete pipe'];
        end
    end
    
    
end
%%%%%%% QUANTITY DISPLAY CALCULATIONS %%%%%%%%%
l_food=length(food_a);
l_bav=length(baverage_a);
l_cloth=length(cloth_a);
l_oth=length(other_a); % % % finding max lenght
l_a=max([l_food l_bav l_cloth l_oth]);
food_a=([food_a zeros(1,l_a-l_food)]);
baverage_a=([baverage_a zeros(1,l_a-l_bav)]);
cloth_a=([cloth_a zeros(1,l_a-l_cloth)]); % % % making all arrays same size
other_a=([other_a zeros(1,l_a-l_oth)]);
AMOUNT=[food_a + baverage_a + cloth_a + other_a];
%%%%%%% CO2 DISPLAY CALCULATIONS FOR AMOOUNT%%%%%%%%%
l_food_PR=length(food_PR);
l_bav_PR=length(baverage_PR);
l_cloth_PR=length(cloth_PR);
l_oth_PR=length(other_PR); % % % finding max lenght
l_pr=max([l_food_PR l_bav_PR l_cloth_PR l_oth_PR]);
food_PR=([food_PR zeros(1,l_pr-l_food_PR)]);
baverage_PR=([baverage_PR zeros(1,l_pr-l_bav_PR)]);
cloth_PR=([cloth_PR zeros(1,l_pr-l_cloth_PR)]); % % % making all arrays same size
other_PR=([other_PR zeros(1,l_pr-l_oth_PR)]);
PRICE=[food_PR + baverage_PR + cloth_PR + other_PR];
%%%%%%% PRICE DISPLAY CALCULATIONS %%%%%%%%%
l_food_co2=length(food_co2);
l_bav_co2=length(baverage_co2);
l_cloth_co2=length(cloth_co2);
l_oth_co2=length(other_co2); % % % finding max lenght
l_c=max([l_food_co2 l_bav_co2 l_cloth_co2 l_oth_co2]);
food_co2=([food_co2 zeros(1,l_c-l_food_co2)]);
baverage_co2=([baverage_co2 zeros(1,l_c-l_bav_co2)]);
cloth_co2=([cloth_co2 zeros(1,l_c-l_cloth_co2)]); % % % making all arrays same size
other_co2=([other_co2 zeros(1,l_c-l_oth_co2)]);
CO2_AMOUNT=[food_co2 + baverage_co2 + cloth_co2 + other_co2];
%%%%%%% MODE DISPLAY CALCULATIONS %%%%%%%%%
M_CAT=string(M_CAT);
for n=1:i
    
    switch M_CAT(n)
        
        case '1' % online shoping
            MODE(n)=['online'];
            pack_type=string(pack_type);
            if pack_type(n)~='0' && pack_type(n)~='18'
                switch pack_type(n) %%%%%%% pack DISPLAY CALCULATIONS %%%%%%%%%
                    case '1'
                        PACK_TYPE(n)=['Aluminium'];
                    case '2'
                        PACK_TYPE(n)=['Cardboard (including corrugate and carbon board)'];
                    case '3'
                        PACK_TYPE(n)=['Wrapping papers'];
                    case '4'
                        PACK_TYPE(n)=['Liquid Beverage cartoons'];
                    case '5'
                        PACK_TYPE(n)=['Glass'];
                    case '6'
                        PACK_TYPE(n)=['PE Bags / Film'];
                    case '7'
                        PACK_TYPE(n)=['PET Bottles'];
                    case '8'
                        PACK_TYPE(n)=['PET Rigids'];
                    case '9'
                        PACK_TYPE(n)=['HDPE Bottles'];
                    case '10'
                        PACK_TYPE(n)=['HDPE Rigids (Boxes/Crates)'];
                    case '11'
                        PACK_TYPE(n)=['PP Rigids (Boxes/Crates)'];
                    case '12'
                        PACK_TYPE(n)=['PP Film / Bags'];
                    case '13'
                        PACK_TYPE(n)=['HIPS Rigids (Yoghurt/Pots)'];
                    case '14'
                        PACK_TYPE(n)=['Other Plastics'];
                    case '15'
                        PACK_TYPE(n)=['Average Plastics'];
                    case '16'
                        PACK_TYPE(n)=['Steel'];
                    case '17'
                        PACK_TYPE(n)=['Wood'];
                        
                end
                CO2_PACK(n)=pack_co2(n);
                fr_type=string(fr_type);
                if fr_type(n)~='0' && fr_type(n)~='5'
                    switch fr_type(n) %%%%%%% DISTANSE DISPLAY CALCULATIONS %%%%%%%%%
                        case '1'
                            TRANS_TYPE(n)=['air frieght'];
                        case '2'
                            TRANS_TYPE(n)=['sea frieght'];
                        case '3'
                            TRANS_TYPE(n)=['rail frieght'];
                        case '4'
                            TRANS_TYPE(n)=['road frieght'];
                            
                    end
                    DISTANCE(n)=fr_a(n);
                    
                    CO2_DISTANCE(n)=fr_co2(n); %%%%%%% CO2 DISPLAY CALCULATIONS FOR TRANSPORTATION%%%%%%%%%
                end
                CO2_PACK(n)=pack_co2(n);
            end
        case '2' % in store mode
            MODE(n)=['traditional'];
            trans_type=string(trans_type);
            if trans_type(n)~='0' && trans_type(n)~='6'
                switch trans_type(n)             %%%%%%% DISTANCE DISPLAY CALCULATIONS %%%%%%%%%
                    case '1'
                        TRANS_TYPE(n)=['Passenger Car'];
                    case '2'
                        TRANS_TYPE(n)=['Light Goods Vehicle'];
                    case '3'
                        TRANS_TYPE(n)=['Heavy Duty Vehicle'];
                    case '4'
                        TRANS_TYPE(n)=['Bus'];
                    case '5'
                        TRANS_TYPE(n)=['walking'];
                end
                DISTANCE(n)=trans_a(n);
                CO2_DISTANCE(n)=trans_co2(n); %%%%%%% CO2 DISPLAY CALCULATIONS FOR TRANSPORTATION%%%%%%%%%
            end
            
            PACK_TYPE(n)=['no packaging used'];
    end
    
    
    
end
%modify CO2_PACK, PACK_TYPE size
l_CO2_PACK=length(CO2_PACK);
CO2_PACK=[CO2_PACK, zeros(1 ,i-l_CO2_PACK)];
l_PACK_TYPE=length(PACK_TYPE);
PACK_TYPE=[PACK_TYPE, zeros(1 ,i-l_PACK_TYPE)];
PACK_TYPE(PACK_TYPE=='0')=['no packaging used'];
% TOTAL CO2 CALCULATIONS(SUM)
CO2=[CO2_PACK]+[CO2_DISTANCE]+[CO2_AMOUNT];
%%%%%%%%%%%%%%%%%%%%%DISPLAYING FINAL RESULTS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[r,C]=max(CO2');%c=highest emission product
AMOUNT=string(AMOUNT);
CO2_AMOUNT=string(CO2_AMOUNT);
PRICE=string(PRICE); %  changing number to string
DISTANCE=string(DISTANCE);
CO2_DISTANCE=string(CO2_DISTANCE);
CO2_PACK=string(CO2_PACK);
CO2=string(CO2);
%making table
format short
menu('Here is your emissions data','next');
T=table(PRODUCT',AMOUNT',CO2_AMOUNT',PRICE',MODE',TRANS_TYPE',DISTANCE',CO2_DISTANCE',PACK_TYPE',CO2_PACK',CO2' );
fig=uifigure('Position', [100 200 1200 400]);
uit=uitable(fig, 'data', T);
uit.Position=[20 70 1150 300];
uit.RowName='numbered';
uit.ColumnName={'     Product Name     ','Amount (kg)','Product Emissions (Kg CO2eq)','Price (RM)','Purchase Methode','   Transpotation Methode   ','Distance (Km)','Transportation Emissions (Kg CO2eq)','     Packaging   Type     ','Packaging Emissions (Kg CO2eq)','Total Carbonfootprint Emissions (Kg CO2eq)'};
%%%%%%%%%%%%%%%%%%% ADVICE CALCULATION AND DISPLAY %%%%%%%%%%%%%%%%%%%%%%%%
menu('Thank You For Using Our Program !!','next');
menu('Finally, here is some tips that could help you reducing your emissions and making a huge contribution towards sustainabilty','next');

if_red_pack=0;
red_trans_1=0;
if_red_trans=0;
red=0;
if_red=0;
percentage=0;
if_percentage=0;
for c=1:i
    
    if c==C % disp for highest emission
        switch MODE(c)
            
            case 'online' %the product is bought online
                if_red_pack=CO2_PACK(c);%suggestion for buying in traditional mode
                if_red_trans=CO2_DISTANCE(c);
                if_red=str2num(CO2(c))-str2num(CO2_PACK(c))-str2num(CO2_DISTANCE(c));
                if_percentage=((str2num(CO2(c))-if_red)/str2num(CO2(c)))*100;
                x=[PRODUCT(c) ' has the highest overall CO2 emissions, you can reduce the emissions from '  CO2(c) ' to '  num2str(if_red)  ' (kg CO2eq) if you bought it in traditional mode.'];
                x=strjoin(x);
                x=[x,  ['Which means a reduction of total emissions for the product by a percentage up to '  num2str(if_percentage) ' %']];
                menu(x, 'next') ;
                
                switch TRANS_TYPE(c)%suggestion if the product isn't available in tradistional mode
                    
                    case 'air frieght'
                        red_trans=(str2num(CO2_DISTANCE(c))*(0.2208/258.75));
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=['If the product is not available in near stores, you still can reduce your emissions by changing the shipping methode from air frieght to either sea or road frieght.', ' This will cause a reduction of total emissions from ' CO2(C) ' to ' num2str(red),' (kg CO2eq).' ];
                        x=strjoin(x);
                        x=[x ['Which means a reduction percentage up to ' num2str(percentage) ' %']];
                        menu(x, 'next') ;
                    case 'rail frieght'
                        red_trans=(str2num(CO2_DISTANCE(c))*(0.0166/2.1));
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=['If the product is not available in near stores, you still can reduce your emissions by changing the shipping methode from rail frieght to road frieght.', 'This will cause a reduction of total emissions from ' CO2(C) ' to ' num2str(red),' (kg CO2eq).'];
                        x=strjoin(x);
                        x=[x [' Which means a reduction percentage up to ' num2str(percentage) ' %']];
                        menu(x, 'next') ;
                    otherwise
                        x=['If the product is not available in near stores, you still can reduce your emissions by choosing a nearer country to buy the product from'];
                        menu(x, 'next') ;
                end
                
            case 'traditional' %the product is bought in store
                switch TRANS_TYPE(c)
                    case 'Passenger Car'
                        red_trans=(str2num(CO2_DISTANCE(c))*(0.0318/0.302));
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=[PRODUCT(c) ' has the highest overall CO2 emissions, you can reduce the emissions from '  CO2(c) ' to '  num2str(red)  ' (Kg CO2eq) if you walk or use bus instead.'];
                        x=strjoin(x);
                        x=[x  [' Which means a reduction of total emissions for the product by a percentage up to '  num2str(percentage) ' %']];
                        menu(x, 'next') ;
                        
                    case 'Light Goods Vehicle'
                        red_trans=(str2num(CO2_DISTANCE(c))*(0.0318/0.1452));
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=[PRODUCT(c) ' has the highest overall CO2 emissions, you can reduce the emissions from '  CO2(c) ' to '  num2str(red)  ' if you walk or use bus instead.'];
                        x=strjoin(x);
                        x=[x  [' Which means a reduction of total emissions for the product by a percentage up to '  num2str(percentage) ' %']];
                        menu(x, 'next') ;
                        
                    case 'Heavy Duty Vehicle'
                        red_trans=(str2num(CO2_DISTANCE(c))*(0.0318/0.2673));
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=[PRODUCT(c) ' has the highest overall CO2 emissions, you can reduce the emissions from '  CO2(c) ' to '  num2str(red)  ' if you walk or use bus instead.'];
                        x=strjoin(x);
                        x=[x [' Which means a reduction of total emissions for the product by a percentage up to '  num2str(percentage) ' %']];
                        menu(x, 'next') ;
                        
                    case 'Bus'
                        red_trans=(str2num(CO2_DISTANCE(c))*0);
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=[PRODUCT(c) ' has the highest overall CO2 emissions, you can reduce the emissions from '  CO2(c) ' to '  num2str(red)  ' if you walk instead.'];
                        x=strjoin(x);
                        x=[x [' Which means a reduction of total emissions for the product by a percentage up to '  num2str(percentage) ' %']];
                        menu(x, 'next') ;
                        
                    otherwise
                        x=['congrats ! ','  your ' PRODUCT(c), ' emissions is the lowest that could be reached, but you still can reduce it more by less consumption for the product.'];
                        x=strjoin(x);
                        menu(x, 'next') ;
                end
        end
    else %other cases
        switch MODE(c)
            
            case 'online' %the product is bought online
                if_red_pack=CO2_PACK(c);%suggestion for buying in traditional mode
                if_red_trans=CO2_DISTANCE(c);
                if_red=str2num(CO2(c))-str2num(CO2_PACK(c))-str2num(CO2_DISTANCE(c));
                if_percentage=((str2num(CO2(c))-if_red)/str2num(CO2(c)))*100;
                x=[PRODUCT(c) ' CO2 emissions can be reduced from '  CO2(c) ' to '  num2str(if_red)  ' (Kg CO2eq) if you bought it in traditional mode.'];
                x=strjoin(x);
                x=[x  [' Which means a reduction of total emissions for the product by a percentage up to '  num2str(if_percentage) ' %']];
                menu(x, 'next') ;
                
                switch TRANS_TYPE(c)%suggestion if the product isn't available in tradistional mode
                    
                    case 'air frieght'
                        red_trans=(str2num(CO2_DISTANCE(c))*(0.2208/258.75));
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=['If the product is not available in near stores, you still can reduce your emissions by changing the shipping methode from air frieght to either sea or road frieght.', ' This will cause a reduction of total emissions from ' CO2(C) ' to ' num2str(red),' (Kg CO2eq).'];
                        x=strjoin(x);
                        x=[x  ['Which means a reduction percentage up to ' num2str(percentage) ' %']];
                        menu(x, 'next') ;
                    case 'rail frieght'
                        red_trans=(str2num(CO2_DISTANCE(c))*(0.0166/2.1));
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=['If the product is not available in near stores, you still can reduce your emissions by changing the shipping methode from rail frieght to road frieght.', ' This will cause a reduction of total emissions from ' CO2(C) ' to ' num2str(red),' (Kg CO2eq).'];
                        x=strjoin(x);
                        x=[x ['which means a reduction percentage up to ' num2str(percentage) ' %']];
                        menu(x, 'next') ;
                    otherwise
                        x=['If the product is not available in near stores, you still can reduce your emissions by choosing a nearer country to buy the product from'];
                        menu(x, 'next') ;
                end
                
            case 'traditional' %the product is bought in store
                switch TRANS_TYPE(c)
                    case 'Passenger Car'
                        red_trans=(str2num(CO2_DISTANCE(c))*(0.0318/0.302));
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=[PRODUCT(c) ' CO2 emissions can be reduced from '  CO2(c) ' to '  num2str(red)  ' (Kg CO2eq) if you walk or use bus instead.'];
                        x=strjoin(x);
                        x=[x [' Which means a reduction of total emissions for the product by a percentage up to '  num2str(percentage) ' %']];
                        menu(x, 'next') ;
                        
                    case 'Light Goods Vehicle'
                        red_trans=(str2num(CO2_DISTANCE(c))*(0.0318/0.1452));
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=[PRODUCT(c) ' CO2 emissions can be reduced from '  CO2(c) ' to '  num2str(red)  ' (Kg CO2eq) if you walk or use bus instead.'];
                        x=strjoin(x);
                        x=[x ['Which means a reduction of total emissions for the product by a percentage up to '  num2str(percentage) ' %']];
                        menu(x, 'next') ;
                        
                    case 'Heavy Duty Vehicle'
                        red_trans=(str2num(CO2_DISTANCE(c))*(0.0318/0.2673));
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=[PRODUCT(c) ' CO2 emissions can be reduced from '  CO2(c) ' to '  num2str(red)  ' if you walk or use bus instead.'];
                        x=strjoin(x);
                        x=[x [' Which means a reduction of total emissions for the product by a percentage up to '  num2str(percentage) ' %']];
                        menu(x, 'next') ;
                        
                    case 'Bus'
                        red_trans=(str2num(CO2_DISTANCE(c))*0);
                        red=str2num(CO2(c))-str2num(CO2_DISTANCE(c))+red_trans;
                        percentage=((str2num(CO2(c))-red)/str2num(CO2(c)))*100;
                        x=[PRODUCT(c) ' CO2 emissions can be reduced from '  CO2(c) ' to '  num2str(red)  ' if you walk instead.'];
                        x=strjoin(x);
                        x=[x [' Which means a reduction of total emissions for the product by a percentage up to ',  num2str(percentage) ,' %']];
                        menu(x, 'next') ;
                        
                    otherwise
                        x=['congrats ! ',' your ' PRODUCT(c), ' emissions is the lowest that could be reached, but you still can reduce it more by less consumption for the product.'];
                        x=strjoin(x);
                        menu(x, 'next') ;
                end
        end
        
        
    end
    
end
menu('Thank You For Using Our Program !!','END');