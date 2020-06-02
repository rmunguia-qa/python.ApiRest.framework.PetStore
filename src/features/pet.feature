# -*- coding: utf-8 -*-

# Created by MuNGuia10 at 27/04/2020

@PetStore
Feature: Test WebApi PetStore
  # En esta feature vamos a realizar un ciclo completo del paso de una mascota por el sistema.
  # Creación de nueva mascota, su consulta, su actualización y "su borrado". Por último, vamos a
  # realizar una consulta de las mascotas de la tienda por estado.

  @Pet
    Scenario: CREACIÓN DE UNA NUEVA MASCOTA
      Given Conectamos con el endpoint pet
      When Cargar el body con el JSON data_body/pet

        # pet id
      Then Asignar a la entidad id el valor 2

        # pet category { id , name }
      Then Asignar al sub-body id el valor 10
      Then Asignar al sub-body name el valor lagarto
      And Añadir valores al sub-body category

        # pet name
      Then Asignar a la entidad name el valor Juancho

        # pet photoUrls [ foto1 , foto2 , ... ]
      Then Asignar al sub-array el valor foto1
      Then Asignar al sub-array el valor foto2
      And Añadir valores al sub-array photoUrls

        # pet tags [ { id , name } ]
      And Añadir valores al sub-array tags

        # pet status options: available, pending, sold
      Then Asignar a la entidad status el valor available

        # POST
      When Realizamos un POST al endpoint

        # PRINT RESPONSE
      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla


  @Pet
    Scenario: CONSULTA DE LA MASCOTA CREADA
      Given Conectamos con el endpoint pet/2

      When Realizamos un GET al endpoint

      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla

        # Verificar los datos
      Then Los elementos <Entity> muestran los valores <Value>
        | Entity | Value      |
        | id     | 2          |
        | name   | Juancho    |
        | status | available  |

      Then Comprobamos el elemento <Entity> en el path <Path> muestran los valores <Value>
        | Entity      | Path   | Value      |
        | category    | id     | 10         |
        | category    | name   | lagarto    |
        | photoUrls   | 0      | NOT NULL   |
        | tags        | 0      | NOT NULL   |


  @Pet
    Scenario: MODIFICACIÓN DE DATOS DE LA MASCOTA
      Given Conectamos con el endpoint pet
      When Cargar el body con el JSON data_body/pet

        # pet id
      Then Asignar a la entidad id el valor 2

        # pet category { id , name }
      Then Asignar al sub-body id el valor 10
      Then Asignar al sub-body name el valor lagarto
      And Añadir valores al sub-body category

        # pet name
      Then Asignar a la entidad name el valor Juancho

        # pet photoUrls [ foto1 , foto2 , ... ]
      Then Asignar al sub-array el valor foto1
      Then Asignar al sub-array el valor foto2
      And Añadir valores al sub-array photoUrls

        # pet tags [ { id , name } ]
      And Añadir valores al sub-array tags

        # pet status options: available, pending, sold
      Then Asignar a la entidad status el valor pending

        # PUT
      When Realizamos un PUT al endpoint

        # PRINT RESPONSE
      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla

        # Verificar la modificación de datos
      Then Los elementos <Entity> muestran los valores <Value>
        | Entity | Value      |
        | status | pending    |

  @Pet
    Scenario: CONSULTA DE MASCOTAS POR ESTADO DISPONIBLE
      Given Conectamos con el endpoint pet/findByStatus?status=available

      When Realizamos un GET al endpoint

      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla

  @Pet
    Scenario: CONSULTA DE MASCOTAS POR ESTADO PENDIENTE
      Given Conectamos con el endpoint pet/findByStatus?status=pending

      When Realizamos un GET al endpoint

      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla

  @Pet
    Scenario: CONSULTA DE MASCOTAS POR ESTADO VENDIDO
      Given Conectamos con el endpoint pet/findByStatus?status=sold

      When Realizamos un GET al endpoint

      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla






