<?php

namespace App\Service\Finance\GeneralWise;

class ShipmentColumnService
{
    public static function getColumns($type)
    {
        if (in_array($type, ['seaair', 'crossair'])) {
            return self::getMainBusinessColumns();
        }
        return self::getDubaiBusinessColumns();
    }

    private static function getMainBusinessColumns()
    {
        return [
            [
                'data' => 'checkbox',
                'name' => 'checkbox',
                'orderable' => false,
                'searchable' => false,
                'className' => 'dt-body-center no-sort',
                'render' => function () {
                    return '<input type="checkbox" class="row-checkbox">';
                },
            ],
            [
                'data' => 'ctd_number',
                'name' => 'ctd_number',
                'orderable' => false,
                'title' => 'CTD NUMBER',
                'width' => '150'
            ],
            [
                'data' => 'status_shipment',
                'name' => 'status_shipment',
                'orderable' => false,
                'title' => 'SHIPMENT STATUS',
                'width' => '250',
                'cutText' => false
            ],
            [
                'data' => 'shipper_name',
                'name' => 'shipper_name',
                'orderable' => false,
                'title' => 'SHIPPER',
                'width' => '250'
            ],
            [
                'data' => 'consigne_name',
                'name' => 'consigne_name',
                'orderable' => false,
                'title' => 'CONSIGNEE',
                'width' => '250'
            ],
            [
                'data' => 'destination_name',
                'name' => 'destination_name',
                'orderable' => false,
                'title' => 'DESTINATION',
                'width' => '250'
            ],
            [
                'data' => 'order.qty',
                'name' => 'order.qty',
                'orderable' => false,
                'title' => 'PIECES',
                'width' => '100'
            ],
            [
                'data' => 'order.gross_weight',
                'name' => 'order.gross_weight',
                'orderable' => false,
                'title' => 'GWT/KGS',
                'width' => '150'
            ],
           
            [
                'data' => 'order.measurement',
                'name' => 'order.measurement',
                'orderable' => false,
                'title' => 'CBM/M3',
                'width' => '150'
            ],
            [
                'data' => 'order.chargeableWeight',
                'name' => 'order.chargeableWeight',
                'orderable' => false,
                'title' => 'CHW/KGS',
                'width' => '100'
            ],
           
            [
                'data' => 'vessel_voyage',
                'name' => 'vessel_voyage',
                'orderable' => false,
                'title' => 'VESSEL/CARRIER',
                'width' => '300',
                'cutText' => false
            ],
            [
                'data' => 'estimated_time_departure',
                'name' => 'estimated_time_departure',
                'orderable' => false,
                'title' => 'ETD',
                'width' => '150'
            ],
            [
                'data' => 'atd',
                'name' => 'atd',
                'orderable' => false,
                'title' => 'ATD',
                'width' => '150'
            ],
            [
                'data' => 'eta',
                'name' => 'eta',
                'orderable' => false,
                'title' => 'ETA',
                'width' => '150'
            ],
            [
                'data' => 'ata',
                'name' => 'ata',
                'orderable' => false,
                'title' => 'ATA',
                'width' => '150'
            ],
            [
                'data' => 'origin_name',
                'name' => 'origin_name',
                'orderable' => false,
                'title' => 'ORIGIN',
                'width' => '250'
            ],
            [
                'data' => 'order.pkgs',
                'name' => 'order.pkgs',
                'orderable' => false,
                'title' => 'PKGS',
                'width' => '100'
            ],
            [
                'data' => 'freight_term',
                'name' => 'freight_term',
                'orderable' => false,
                'title' => 'TERMS',
                'width' => '150'
            ],
            [
                'data' => 'shipment_type',
                'name' => 'shipment_type',
                'orderable' => false,
                'title' => 'SHIPMENT BY',
                'width' => '150'
            ],
            [
                'data' => 'transit_via',
                'name' => 'transit_via',
                'orderable' => false,
                'title' => 'ROUTING',
                'width' => '150'
            ],
            [
                'data' => 'action',
                'name' => 'action',
                'orderable' => false,
                'title' => 'ACTION',
                'width' => '100'
            ],
        ];
    }

    private static function getDubaiBusinessColumns()
    {
        return [
            [
                'data' => 'checkbox',
                'name' => 'checkbox',
                'orderable' => false,
                'searchable' => false,
                'className' => 'dt-body-center no-sort',
                'render' => function () {
                    return '<input type="checkbox" class="row-checkbox">';
                },
            ],
            [
                'data' => 'ctd_number',
                'name' => 'ctd_number',
                'orderable' => false,
                'title' => 'HBL NUMBER',
                'width' => '150'
            ],
            [
                'data' => 'status_shipment',
                'name' => 'status_shipment',
                'orderable' => false,
                'title' => 'SHIPMENT STATUS',
                'width' => '250',
                'cutText' => false
            ],
            [
                'data' => 'shipper_name',
                'name' => 'shipper_name',
                'orderable' => false,
                'title' => 'SHIPPER',
                'width' => '250'
            ],
            [
                'data' => 'consigne_name',
                'name' => 'consigne_name',
                'orderable' => false,
                'title' => 'CONSIGNEE',
                'width' => '250'
            ],
            [
                'data' => 'destination_name',
                'name' => 'destination_name',
                'orderable' => false,
                'title' => 'DESTINATION',
                'width' => '100'
            ],
            [
                'data' => 'order.qty',
                'name' => 'order.qty',
                'orderable' => false,
                'title' => 'PIECES',
                'width' => '100'
            ],
            [
                'data' => 'order.gross_weight',
                'name' => 'order.gross_weight',
                'orderable' => false,
                'title' => 'GWT/KGS',
                'width' => '100'
            ],
            [
                'data' => 'order.measurement',
                'name' => 'order.measurement',
                'orderable' => false,
                'title' => 'CBM/M3',
                'width' => '100'
            ],
            [
                'data' => 'order.chw',
                'name' => 'order.chw',
                'orderable' => false,
                'title' => 'CHW/KGS',
                'width' => '100'
            ],
            [
                'data' => 'vessel_voyage',
                'name' => 'vessel_voyage',
                'orderable' => false,
                'title' => 'VESSEL/CARRIER',
                'width' => '300',
                'cutText' => false
            ],
            [
                'data' => 'estimated_time_departure',
                'name' => 'estimated_time_departure',
                'orderable' => false,
                'title' => 'ETD',
                'width' => '100'
            ],
            [
                'data' => 'atd',
                'name' => 'atd',
                'orderable' => false,
                'title' => 'ATD',
                'width' => '100'
            ],
            [
                'data' => 'eta',
                'name' => 'eta',
                'orderable' => false,
                'title' => 'ETA Transit Hub',
                'width' => '100'
            ],
            [
                'data' => 'ata',
                'name' => 'ata',
                'orderable' => false,
                'title' => 'ATA Transit Hub',
                'width' => '100'
            ],
            [
                'data' => 'origin_name',
                'name' => 'origin_name',
                'orderable' => false,
                'title' => 'ORIGIN',
                'width' => '250'
            ],
            [
                'data' => 'order.pkgs',
                'name' => 'order.pkgs',
                'orderable' => false,
                'title' => 'PKGS',
                'width' => '100'
            ],
            [
                'data' => 'freight_term',
                'name' => 'freight_term',
                'orderable' => false,
                'title' => 'TERMS',
                'width' => '100'
            ],
            [
                'data' => 'shipment_type',
                'name' => 'shipment_type',
                'orderable' => false,
                'title' => 'SHIPMENT BY',
                'width' => '100'
            ],
            [
                'data' => 'transit_via',
                'name' => 'transit_via',
                'orderable' => false,
                'title' => 'ROUTING',
                'width' => '100'
            ],
            [
                'data' => 'days_closed.days',
                'name' => 'transit_time',
                'orderable' => false,
                'title' => 'TRANSIT TIME',
                'width' => '100'
            ],
            [
                'data' => 'action',
                'name' => 'action',
                'orderable' => false,
                'title' => 'Action',
                'width' => '100',
                'className' => 'text-center'
            ]
        ];
    }
}