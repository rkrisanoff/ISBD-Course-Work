INSERT INTO positronic_brain (release_series,name,speed,cost) VALUES (441,'LYNN',156,187);
INSERT INTO positronic_brain (release_series,name,speed,cost) VALUES (656,'L2B8D',487,572);
INSERT INTO positronic_brain (release_series,name,speed,cost) VALUES (526,'L2B8D',560,57);
INSERT INTO positronic_brain (release_series,name,speed,cost) VALUES (152,'LYNN',931,461);
INSERT INTO positronic_brain (release_series,name,speed,cost) VALUES (808,'L2B8D',271,227);
INSERT INTO body (release_series,name,max_hit_points,cost) VALUES (696,'ANTON',16477,509);
INSERT INTO body (release_series,name,max_hit_points,cost) VALUES (898,'TOLYAN',5371,41);
INSERT INTO body (release_series,name,max_hit_points,cost) VALUES (406,'ANTON',1318,558);
INSERT INTO body (release_series,name,max_hit_points,cost) VALUES (654,'ROMAN',10407,202);
INSERT INTO body (release_series,name,max_hit_points,cost) VALUES (158,'ARTYOM',18558,87);
INSERT INTO eyes_sensors (release_series,name,distance,cost) VALUES (760,'DIMON',10514,140);
INSERT INTO eyes_sensors (release_series,name,distance,cost) VALUES (771,'DIMON',11783,808);
INSERT INTO eyes_sensors (release_series,name,distance,cost) VALUES (934,'VASYAN',3109,601);
INSERT INTO eyes_sensors (release_series,name,distance,cost) VALUES (979,'DIMON',14063,873);
INSERT INTO eyes_sensors (release_series,name,distance,cost) VALUES (509,'DIMON',566,212);
INSERT INTO department (id,extracted_bor_quantity,current_resource) VALUES (581,16818,10720);
INSERT INTO department (id,extracted_bor_quantity,current_resource) VALUES (551,17748,11190);
INSERT INTO department (id,extracted_bor_quantity,current_resource) VALUES (29,18448,7979);
INSERT INTO department (id,extracted_bor_quantity,current_resource) VALUES (162,19081,14155);
INSERT INTO department (id,extracted_bor_quantity,current_resource) VALUES (932,16174,697);
INSERT INTO employee (id,name,age,gender) VALUES (388,'Thomas',29,'female');
INSERT INTO employee (id,name,age,gender) VALUES (937,'Alfie',21,'male');
INSERT INTO employee (id,name,age,gender) VALUES (470,'Jack',53,'female');
INSERT INTO employee (id,name,age,gender) VALUES (298,'Harry',40,'female');
INSERT INTO employee (id,name,age,gender) VALUES (851,'Jacob',53,'male');
INSERT INTO employee (id,name,age,gender) VALUES (92,'Riley',35,'female');
INSERT INTO employee (id,name,age,gender) VALUES (687,'Riley',43,'female');
INSERT INTO employee (id,name,age,gender) VALUES (57,'Oliver',31,'female');
INSERT INTO employee (id,name,age,gender) VALUES (632,'Thomas',42,'female');
INSERT INTO employee (id,name,age,gender) VALUES (460,'Oliver',54,'male');
INSERT INTO employee (id,name,age,gender) VALUES (630,'Thomas',33,'female');
INSERT INTO employee (id,name,age,gender) VALUES (98,'James',53,'female');
INSERT INTO employee (id,name,age,gender) VALUES (60,'Jack',51,'male');
INSERT INTO employee (id,name,age,gender) VALUES (27,'Harry',59,'female');
INSERT INTO employee (id,name,age,gender) VALUES (450,'Jacob',38,'female');
INSERT INTO employee (id,name,age,gender) VALUES (496,'Oliver',42,'female');
INSERT INTO employee (id,name,age,gender) VALUES (819,'Harry',30,'female');
INSERT INTO employee (id,name,age,gender) VALUES (880,'Alfie',38,'male');
INSERT INTO employee (id,name,age,gender) VALUES (596,'Harry',25,'male');
INSERT INTO employee (id,name,age,gender) VALUES (909,'Jack',50,'male');
INSERT INTO asteroid (id,name,distance) VALUES (129,'Pallas',13581);
INSERT INTO asteroid (id,name,distance) VALUES (840,'Vesta',13909);
INSERT INTO asteroid (id,name,distance) VALUES (60,'Pallas',19032);
INSERT INTO asteroid (id,name,distance) VALUES (750,'Flora',7165);
INSERT INTO asteroid (id,name,distance) VALUES (989,'Metis',10283);
INSERT INTO asteroid (id,name,distance) VALUES (529,'Hebe',274);
INSERT INTO asteroid (id,name,distance) VALUES (277,'Ceres',13632);
INSERT INTO asteroid (id,name,distance) VALUES (127,'Astraea',18394);
INSERT INTO asteroid (id,name,distance) VALUES (499,'Pallas',12202);
INSERT INTO asteroid (id,name,distance) VALUES (45,'Pallas',13902);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (420,989,302);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (358,499,820);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (227,277,425);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (733,499,490);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (265,840,254);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (267,499,305);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (513,750,544);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (881,60,144);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (880,45,123);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (779,750,186);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (360,840,427);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (525,60,952);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (119,989,264);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (959,45,592);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (623,499,507);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (717,129,75);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (146,529,114);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (784,60,11);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (994,529,982);
INSERT INTO deposit (id,asteroid_id,bor_quantity) VALUES (591,529,817);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (853,656,460,654,979,1802,840);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (597,656,851,406,771,1359,45);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (737,152,450,654,979,16618,60);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (341,441,630,654,934,6505,60);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (489,152,450,158,760,16803,127);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (611,152,470,158,760,2217,750);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (497,441,450,696,760,19440,60);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (434,152,596,158,771,15974,750);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (9,808,880,158,771,688,529);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (529,808,819,898,979,10264,529);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (674,441,630,654,509,19386,499);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (536,152,470,158,509,5659,750);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (186,152,460,158,771,2043,127);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (318,808,298,898,771,7746,499);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (455,808,460,898,771,15412,127);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (400,656,851,158,979,1065,127);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (697,526,880,696,771,11529,840);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (629,656,630,654,771,8449,60);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (563,441,851,696,760,17476,750);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (219,152,851,898,509,1714,840);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (867,656,851,158,979,8113,840);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (668,656,851,406,771,1266,129);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (986,152,298,158,934,4100,499);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (524,808,57,406,934,8935,529);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (793,526,298,898,979,6109,60);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (647,441,632,696,979,11873,45);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (276,441,819,696,509,13614,127);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (400,441,819,406,934,19039,529);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (293,152,687,654,979,10068,750);
INSERT INTO robot (id,brain_series,operator_id,body_series,eye_series,hit_points,asteroid_id) VALUES (959,656,630,898,771,202,529);
INSERT INTO microreactor_type (id,name,cost,b2_h6_consumption_rate,b5_h12_consumption_rate,b10_h14_consumption_rate,b12_h12_consumption_rate) VALUES (420,'MK1',4693,13663,11716,6651,10787);
INSERT INTO microreactor_type (id,name,cost,b2_h6_consumption_rate,b5_h12_consumption_rate,b10_h14_consumption_rate,b12_h12_consumption_rate) VALUES (315,'MK3',16634,9689,17073,2977,17998);
INSERT INTO microreactor_type (id,name,cost,b2_h6_consumption_rate,b5_h12_consumption_rate,b10_h14_consumption_rate,b12_h12_consumption_rate) VALUES (103,'MK1',1628,6018,10089,12547,8438);
INSERT INTO microreactor_type (id,name,cost,b2_h6_consumption_rate,b5_h12_consumption_rate,b10_h14_consumption_rate,b12_h12_consumption_rate) VALUES (618,'MK2',13860,5576,1569,523,9059);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (158,29,10106,10314,14971,8847,8211);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (255,581,15268,18671,9694,1793,9707);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (235,932,8018,19941,6713,16992,3969);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (289,162,18234,1903,12040,5582,13138);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (474,29,1798,5148,15907,16442,8093);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (447,932,10011,4233,11439,10282,16489);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (708,162,3750,14999,7739,9256,15217);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (250,551,8736,14683,9895,12407,15228);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (648,932,7451,14629,7059,8922,16182);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (360,29,8160,8339,1655,7152,14429);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (294,551,5248,3739,5290,1568,11811);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (923,29,2096,17206,4224,145,15644);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (432,551,3923,7625,19215,4326,16397);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (857,581,11947,7939,2900,6990,2579);
INSERT INTO spaceship (id,department_id,income,b2_h6_quantity,b5_h12_quantity,b10_h14_quantity,b12_h12_quantity) VALUES (729,581,17356,1722,3849,5963,3486);
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (618,250,'2021-02-14');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,360,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (618,158,'2021-02-14');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (103,729,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (103,294,'2021-02-14');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (618,360,'2021-02-13');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (315,289,'2021-02-14');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (618,432,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (315,857,'2021-02-14');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,250,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,857,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,255,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,447,'2021-02-14');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,857,'2021-02-14');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (103,474,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (103,250,'2021-02-13');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,432,'2021-02-13');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,235,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,289,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (618,158,'2021-02-14');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (315,729,'2021-02-14');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,648,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (618,294,'2021-02-13');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (618,923,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,289,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (315,158,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (618,250,'2021-02-14');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (103,923,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,294,'2021-02-12');
INSERT INTO microreactor_in_spaceship (microreactor_type_id,spaceship_id,deploy_date) VALUES (420,857,'2021-02-14');
INSERT INTO role (id,name,salary,can_operate_robot) VALUES (683,'operator',5687,TRUE);
INSERT INTO role (id,name,salary,can_operate_robot) VALUES (472,'operator',6301,TRUE);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (80,298,472,551,28);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (568,388,683,162,884);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (890,596,683,162,773);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (847,450,683,932,177);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (689,388,472,162,455);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (897,57,683,29,866);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (31,388,472,29,603);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (451,470,683,162,227);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (765,937,472,581,202);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (863,57,472,162,324);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (635,470,683,551,415);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (801,937,683,581,240);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (790,596,683,29,62);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (562,937,683,932,175);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (731,632,683,932,759);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (931,851,472,581,621);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (509,450,683,932,727);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (455,630,683,551,854);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (460,880,472,581,181);
INSERT INTO post (id,employee_id,role_id,department_id,premium) VALUES (439,632,472,29,142);
INSERT INTO task (id,description,state,creator_post_id,executor_post_id,cost) VALUES (997,'Прежде всего, выбранный нами инновационный путь представляет собой интересный эксперимент проверки приоретизации разума над эмоциями. ','need help',509,509,973);
INSERT INTO task (id,description,state,creator_post_id,executor_post_id,cost) VALUES (502,'Принимая во внимание показатели успешности, повышение уровня гражданского сознания не оставляет шанса для позиций, занимаемых участниками в отношении поставленных задач.','in work',439,455,750);
INSERT INTO task (id,description,state,creator_post_id,executor_post_id,cost) VALUES (971,'Прежде всего, выбранный нами инновационный путь представляет собой интересный эксперимент проверки приоретизации разума над эмоциями. ','complete',731,451,600);
INSERT INTO task (id,description,state,creator_post_id,executor_post_id,cost) VALUES (390,'Ясность нашей позиции очевидна: новая модель организационной деятельности создаёт предпосылки для глубокомысленных рассуждений. Прежде всего, внедрение современных методик напрямую зависит от приоретизации разума над эмоциями. ','waiting for resolution',801,897,957);
INSERT INTO task (id,description,state,creator_post_id,executor_post_id,cost) VALUES (699,'Таким образом, новая модель организационной деятельности не оставляет шанса для кластеризации усилий.','waiting for resolution',455,509,523);
INSERT INTO task (id,description,state,creator_post_id,executor_post_id,cost) VALUES (415,'Ясность нашей позиции очевидна: новая модель организационной деятельности создаёт предпосылки для глубокомысленных рассуждений. Прежде всего, внедрение современных методик напрямую зависит от приоретизации разума над эмоциями. ','complete',562,790,877);
INSERT INTO task (id,description,state,creator_post_id,executor_post_id,cost) VALUES (988,'Следует отметить, что семантический разбор внешних противодействий однозначно определяет каждого участника как способного принимать собственные решения касаемо направлений прогрессивного развития!','waiting for resolution',439,790,70);
INSERT INTO task (id,description,state,creator_post_id,executor_post_id,cost) VALUES (655,'Прежде всего, выбранный нами инновационный путь представляет собой интересный эксперимент проверки приоретизации разума над эмоциями. ','in work',568,931,813);
INSERT INTO task (id,description,state,creator_post_id,executor_post_id,cost) VALUES (35,'Прежде всего, выбранный нами инновационный путь представляет собой интересный эксперимент проверки приоретизации разума над эмоциями. ','need help',509,847,860);
INSERT INTO task (id,description,state,creator_post_id,executor_post_id,cost) VALUES (643,'Принимая во внимание показатели успешности, повышение уровня гражданского сознания не оставляет шанса для позиций, занимаемых участниками в отношении поставленных задач.','need help',460,31,675);
