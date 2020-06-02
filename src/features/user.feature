# -*- coding: utf-8 -*-

# Created by MuNGuia10 at 27/04/2020

@PetStore
Feature: Test WebApi PetStore
  # En esta feature vamos a realizar un ciclo completo del paso de un usuario por el sistema.
  # Creación de nuevo usuario, su consulta, su modificación, consulta de usuarios con login y
  # sin login y "su borrado".

  @User
    Scenario: CREACIÓN DE UN NUEVO USUARIO
      Given Conectamos con el endpoint user
      When Cargar el body con el JSON data_body/user

        # user id - integer
      Then Asignar a la entidad id el valor 5963

        # user username - string
      Then Asignar a la entidad username el valor Panther77

        # user firstName - string
      Then Asignar a la entidad firstName el valor Ruben

        # user lastName - string
      Then Asignar a la entidad lastName el valor Munguia

        # user email - string
      Then Asignar a la entidad email el valor random

        # user password - string
      Then Asignar a la entidad password el valor random

        # user phone - string
      Then Asignar a la entidad phone el valor random number

        # user userStatus - integer
      Then Asignar a la entidad userStatus el valor 0

        # POST
      When Realizamos un POST al endpoint

        # PRINT RESPONSE
      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla


  @User
    Scenario: CONSULTA DEL USUARIO CREADO
      Given Conectamos con el endpoint user/Panther77

      When Realizamos un GET al endpoint

      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla

        # Verificar los datos
      Then Los elementos <Entity> muestran los valores <Value>
        | Entity     | Value     |
        | id         | 5963      |
        | username   | Panther77 |
        | firstName  | Ruben     |
        | lastName   | Munguia   |
        | email      | NOT NULL  |
        | password   | NOT NULL  |
        | phone      | NOT NULL  |
        | userStatus | 0         |

  @User
    Scenario: LOGIN USUARIO & LOGOUT
      Given Conectamos con el endpoint user/login?username=Panther77&password=hsbklxhier

      When Realizamos un GET al endpoint

      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla

      Given Conectamos con el endpoint user/logout

      When Realizamos un GET al endpoint

      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla


  @User
    Scenario: MODIFICACIÓN DE DATOS DEL USUARIO
      Given Conectamos con el endpoint user/Panther77
      When Cargar el body con el JSON data_body/user

        # user id - integer
      Then Asignar a la entidad id el valor 5963

        # user username - string
      Then Asignar a la entidad username el valor Panther77

        # user firstName - string
      Then Asignar a la entidad firstName el valor Ruben

        # user lastName - string
      Then Asignar a la entidad lastName el valor Munguia

        # user email - string
      Then Asignar a la entidad email el valor kdbdmbgkyi@gmail.com

        # user password - string
      Then Asignar a la entidad password el valor hsbklxhier

        # user phone - string
      Then Asignar a la entidad phone el valor 580734180

        # user userStatus - integer
      Then Asignar a la entidad userStatus el valor 10

        # PUT
      When Realizamos un PUT al endpoint

        # PRINT RESPONSE
      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla

        # Verificar la modificación de datos
      Then Los elementos <Entity> muestran los valores <Value>
        | Entity  | Value |
        | message | 5963  |