# -*- coding: utf-8 -*-

# Created by MuNGuia10 at 27/04/2020

@PetStore
Feature: Test WebApi PetStore
  # En esta feature vamos a realizar un ciclo completo del paso de un pedido por el sistema.
  # Creación de nuevo pedido, su consulta, consulta del inventario y "su borrado".

  @Store
    Scenario: CREACIÓN DE UN NUEVO PEDIDO
      Given Conectamos con el endpoint store/order
      When Cargar el body con el JSON data_body/store

        # store id - integer
      Then Asignar a la entidad id el valor 5403

        # store petId - integer
      Then Asignar a la entidad petId el valor 2

        # store quantity - integer
      Then Asignar a la entidad quantity el valor 20

        # store shipDate - string($date-time)
      Then Asignar a la entidad shipDate el valor 2020-04-29T19:32:10.681Z

        # store status options: placed, approved, delivered
      Then Asignar a la entidad status el valor placed

        # store complete - true or false
      Then Asignar a la entidad complete el valor False

        # POST
      When Realizamos un POST al endpoint

        # PRINT RESPONSE
      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla


  @Store
    Scenario: CONSULTA DEL PEDIDO CREADO
      Given Conectamos con el endpoint store/order/5403

      When Realizamos un GET al endpoint

      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla

        # Verificar los datos
      Then Los elementos <Entity> muestran los valores <Value>
        | Entity    | Value                        |
        | id        | 5403                         |
        | petId     | 2                            |
        | quantity  | 20                           |
        | shipDate  | 2020-04-29T19:32:10.681+0000 |
        | status    | placed                       |
        | complete  | False                        |

  @Store
    Scenario: CONSULTA DEL INVENTARIO
      Given Conectamos con el endpoint store/inventory

      When Realizamos un GET al endpoint

      Then El status code del RESPONSE es 200
      And Mostramos el RESPONSE por pantalla