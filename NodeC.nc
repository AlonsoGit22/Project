/**
 * ANDES Lab - University of California, Merced
 * This class provides the basic functions of a network node.
 *
 * @author UCM ANDES Lab
 * @date   2013/09/03
 *
 */

#include <Timer.h>
#include "includes/CommandMsg.h"
#include "includes/packet.h"

configuration NodeC{
}
implementation {
    components MainC;
    components Node;
    components new AMReceiverC(AM_PACK) as GeneralReceive;

    Node -> MainC.Boot;

    Node.Receive -> GeneralReceive;

    components ActiveMessageC;
    Node.AMControl -> ActiveMessageC;

    components new SimpleSendC(AM_PACK);
    Node.Sender -> SimpleSendC;

    components CommandHandlerC;
    Node.CommandHandler -> CommandHandlerC;


    /* new code */
        /* new list for where the neighbors are located in relation to their order */
    components new ListC(uint16_t, 20) as NeighborQueueListC;

    /* new list neighbors we know about */
    components new PoolC(uint16_t, 20) as PoolC;

    /* Random CSMA binary push back */
    components RandomC as Random;

    /* Timer components for timing */
    components new TimerMilliC() as NodeTimer;

    /* Tracking the sends to all the nodes */
    components new AMSenderC(AM_Pack);

    /* pointers from the Node file to the storage found in NodeC.nc) */
    Node.NeighborQueueList -> NeighborQueueListC;
    Node.NeighborPool -> NeighborPoolC;
    Node.Random -> RandomC;
    Node.NodeTimer -> NodeTimer;
    Node.AMSend -> AMSender



}
