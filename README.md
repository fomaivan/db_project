# База данных
#### **Цель:** Создать Базу данных для сервиса покупки билетов в кино.
---
---
Приложение должно позволять пользователю покупать билеты в приложении в одном из кинотеатров его города, соответсвенно под эти цели попробуем выделить сущности.

###### Выделим 6 сущностей:
`employer` - пользователь, `ticket` - билет
`cinema` - кинотеатр, `hall` - зал
 `movie` - фильм, `screening` - показ фильма, или сессия
 
 Сделаем Базу Данных в 2НФ
 
 Концептуальная модель:
 ![Image alt](https://github.com/fomaivan/db_project/blob/master/docs/conceptual-model.png)
 
  Логическая модель после нормализации:
  ![Image alt](https://github.com/fomaivan/db_project/blob/master/docs/logical-model.png)

 Физическая модель:
 ![Image alt](https://github.com/fomaivan/db_project/blob/master/docs/physical-model.md)
