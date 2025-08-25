namespace PlannedOrderSrv;
using { cdsdatamodel.db.cdsviews as CdsViews } from '../db/cdsdatamodel';
using { plannedorder.db as dbmodel } from '../db/datamodel';


service PlannedOrderService @(path:'PlannedOrderData',requires:'authenticated-user') {

     entity CdsPlannedOrderData @(restrict: [
        {
            grant: ['READ'],
            to   : 'Viewer',
            where: 'Plant = 0001'
        },
        {
            grant: ['WRITE'],
            to   : 'Admin'
        }
    ] )                        as projection on CdsViews.plannedOrderCDSview;


  //  entity CdsPlannedOrderData as projection on CdsViews.plannedOrderCDSview;
    @cds.redirection.target
    entity cdsComponentData as projection on CdsViews.ComponentView;
    entity dbmaterial as projection on dbmodel.masterdata.material;
    entity dbcomponents as projection on dbmodel.masterdata.components;
    entity dbcapacity as projection on dbmodel.masterdata.capacity;
    entity dbPlannedOrder as projection on dbmodel.transactional.plannedorder;

   

}


