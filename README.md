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
 ![Image alt](https://gitlab.atp-fivt.org/db2023/fominiv-project/-/blob/dev/docs/conceptual-model.png)
 
  Логическая модель после нормализации:
https://gitlab.atp-fivt.org/db2023/fominiv-project/-/blob/dev/docs/logical-model.png

 Физическая модель:       https://gitlab.atp-fivt.org/db2023/fominiv-project/-/blob/dev/docs/physical-model.md
