# RegistrationStoreApp
# Тестовое задание
Создать приложение, отображающее список локаций, загруженных из json-файла с возможностью просмотра информации о каждом конкретном месте с отображением его позиции на карте. 
Также, список можно фильтровать по избранным местам.

## Общие требования:

1.	Насколько визуал соответствует Figma
2.	Насколько чисто и расширяемо написан код, и соответствует SOLID
3.	Какое архитектурное решение реализовано
4.	Умение пользоваться основными библиотеками

### Первый-Второй экран:

Сценарии использования:

Пользователь хочет авторизоваться 

•	Пользователь запускает мобильное приложение. Открывается начальный экран авторизации «sign in page» *

a.Если у пользователя уже есть аккаунт, то он нажимает кнопку «log in», которая находится под кнопкой «sign in». Открывается экран «Login», где пользователь вводит свои данные и нажимает кнопку «Login». Проверяется есть ли действительно такой аккаунт в базе данных.  Если аккаунт есть в базе, то открывается Tab Bar и экран «Page 1», если такого пользователя не существует, то показывается соответствующая ошибка 
b.	Если у пользователя нет аккаунта, то он вводит в соответствующие поля Имя, Фамилию, Email и нажимает кнопку «sign in». Введенные данные сохраняются локально в базу данных. Пользователь также может авторизоваться с помощью аккаунта Google или Apple (сделать только визуально). Открывается Tab Bar и экран «Page 1» 
c.	Если пользователь не помнит, что уже регистрировался и вводит данные для регистрации, которые есть в базе данных, то показывается соответствующая ошибка об уже существующем пользователе с такими данными 

https://github.com/Moroz9/RegistrationStoreApp/assets/126159245/8c0d9788-8df2-4d88-8807-e7ce6d4740d0

https://github.com/Moroz9/RegistrationStoreApp/assets/126159245/9de8ff4e-813d-4857-a1f7-4b647294b2d3

### Третий экран:

Пользователь хочет посмотреть информацию в своем профиле

•	Пользователь нажимает на иконку с контроллером «Profile» в Tab Bar, чтобы перейти на соответствующий экран *
•	На экране выводится вся доступная информация о профиле, управлении им и его настройки *

Пользователь хочет выйти из профиля

•	Пользователь находится на экране «Profile» *
•	Пользователь хочет выйти из профиля и нажимает на кнопку «Log out». Происходит лог аут и открывается начальный экран «sign in page» *

Пользователь хочет обновить фотографию в профиле
(выполнение по возможности)

•	Пользователь находится на экране «Profile»
•	Нажимает на кнопку «Change photo», которая находится под фотографией пользователя. Открывается библиотека фотографий телефона
•	Пользователь выбирает фотографию и загружает ее
•	Фотография пользователя обновляется


### Четвертый экран:
Данные в блоке Latest и Flash Sale можно получить с помощью двух разных API, но обработка и дальнейшее отображение данных на экране следует производить СТРОГО после того, когда были получены ВСЕ данные, другими словами, после объединения полученных данных. Например: если пришли данные для Latest, но не пришли для Flash Sale, то отображение данных в обоих блоках не происходит.

### Пятый экран:
