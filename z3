#1-я фун: список студентов ОДНОГО курса в алфавитном порядке (пусть по фамилии)
#2-я фун: средний балл каждой группы по каждому предмету
#3-я фун: определение самого старшего студента и самого младшего
#4-я фун: словарь, где для каждой группы выделяется лучший студент по успеваемости.

#сортировкка по алфавиту
def sortirivka_po_alfavitu(spisok, kurs):
    temp = []
    for i in range(0,len(spisok)): #пробегает по каждому студенту
        for key, val in spisok[i].items(): #пробегает по ключу и значению каждого студента
            if key == 'Курс' and val == kurs:
                for key, val in spisok[i].items():
                    if key == 'Фамилия':
                      temp.append(val)
    temp.sort()
    print(temp)

#============средний балл===============
def sredniy_ball(spisok, kurs):
    temp = []
    for i in range(0, len(spisok)): #пробегает по каждому студенту
        for key, val in spisok[i].items(): #пробегает по ключу и значению каждого студента
            if key == 'Группа':
                temp.append(val) #список всех групп с повторением
    temp_1 = list(set(temp)) #список групп без повторения

    for gruppa in range(0, len(temp_1)):

        matem = 0
        himiya = 0
        russkiy = 0
        fizika = 0
        grafika = 0
        kol_vo = 0  # коилчество студентов

        a = temp_1[gruppa] #присваивание группы
        print(a)
        temp_2 = list(filter(lambda item: item['Группа'] == a, spisok))
        for i in range(0, len(temp_2)):
            for key, val in temp_2[i].items():
                if key == 'Математика':
                    matem = matem + val
                    kol_vo = kol_vo+1
                if key == 'Химия':
                    himiya = himiya + val
                if key == 'Русский':
                    russkiy = russkiy + val
                if key == 'Физика':
                    fizika = fizika + val
                if key == 'Графика':
                    grafika = grafika + val
        print('Математика:', matem/kol_vo,'Химия:', himiya/kol_vo, 'Русский:', russkiy/kol_vo, 'Физика:', fizika/kol_vo, 'Графика:', grafika/kol_vo)


#======старший и младший студенты================
def year(spisok, kurs):
    """
    temp = {}
    for i in range(0,len(spisok)):
        for key, val in spisok[i].items():
            if key == 'Фамилия':
                temp[val] = key
                for key_1, val_1 in spisok[i].items():
                    if key_1 == 'Год рождения':
                        temp[val] = val_1
    v = list(temp.values())
    k = list(temp.keys())
    #print(temp)
    #print('Младший студент: ', k[v.index(max(v))])
    #print('Старший студент: ', k[v.index(min(v))])
    """
    print('Старший студент: ', min(spisok, key=lambda i: i['Год рождения']))
    print('Младший студент: ', max(spisok, key=lambda i: i['Год рождения']))

#=======================самый успешный студент в группе================
#самый успешным пусть будет тот, у которого средний балл в общем больше
def uspeh(spisok, kurs):
    temp = []
    temp_2 = []
    for i in range(0, len(spisok)):  # пробегает по каждому студенту
        for key, val in spisok[i].items():  # пробегает по ключу и значению каждого студента
            if key == 'Группа':
                temp.append(val)  # список всех групп с повторением
    temp_1 = list(set(temp))  # список групп без повторения

    #spisok_groups = sorted(spisok, key=lambda v: v['Группа']) #сортировка списка по группам

    for gruppa in range(0, len(temp_1)):
        a = temp_1[gruppa] #присваивание группы
        temp_2 = list(filter(lambda item: item['Группа'] == a, spisok))
        print(temp_2)
        print(a)
        print('Отстающий: ', min(temp_2, key=lambda i: i['Математика'] + i['Химия'] + i['Русский'] + i['Физика'] + i['Графика']))
        print('Успевающий: ', max(temp_2, key=lambda i: i['Математика'] + i['Химия'] + i['Русский'] + i['Физика'] + i['Графика']))


kurs = 3 #номер курса
sredniy_ball([
    {'Фамилия': 'Сидоров', 'Имя': 'Иван', 'Отчество': 'Денисов', 'Год рождения': 2000, 'Курс': 1, 'Группа': 208,
     'Математика': 5, 'Химия': 3, 'Русский': 4, 'Физика': 5, 'Графика':4},
    {'Фамилия': 'Якушев', 'Имя': 'Пётр', 'Отчество': 'Андреевич', 'Год рождения': 1998, 'Курс': 3, 'Группа': 210,
     'Математика': 2, 'Химия': 5, 'Русский': 3, 'Физика': 3, 'Графика':5},
    {'Фамилия': 'Ермохина', 'Имя': 'Анна', 'Отчество': 'Кириловна', 'Год рождения': 2000, 'Курс': 1, 'Группа': 208,
     'Математика': 4, 'Химия': 4, 'Русский': 4, 'Физика': 5, 'Графика':3},
    {'Фамилия': 'Краснова', 'Имя': 'Елена', 'Отчество': 'Антонова', 'Год рождения': 1997, 'Курс': 3, 'Группа': 210,
     'Математика': 5, 'Химия': 5, 'Русский': 5, 'Физика': 5, 'Графика':4}
], kurs)







