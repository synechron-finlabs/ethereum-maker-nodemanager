pragma solidity ^0.4.23;
contract NetworkManagerContract {

    uint nodeCounter;
  
    struct NodeDetails {  
        string nodeName;
        string role; 
        string publickey;
        string enode;
        string ip;
        string id;
    }

    mapping (string => NodeDetails)nodes;
    string[] enodeList;
    
    event print(string nodeName, string role,string publickey, string enode, string ip, string id);

    function registerNode(string n, string r, string p,string e, string ip, string id) public {

        nodes[e].publickey = p;
        nodes[e].nodeName = n;
        nodes[e].role = r;
        nodes[e].ip = ip;
        nodes[e].id = id;
        enodeList.push(e);
        emit print(n, r, p, e, ip, id);
    
    }
   
    function getNodeDetails(uint16 _index) constant public returns (string n, string r,string p,string ip,string e,string id,uint i) {
        NodeDetails memory nodeInfo = nodes[enodeList[_index]];
        return (
            nodeInfo.nodeName,
            nodeInfo.role,
            nodeInfo.publickey,
            nodeInfo.ip,
            enodeList[_index],
            nodeInfo.id,
            _index
        );
    }

    function getNodesCounter() public constant  returns (uint) {
        return enodeList.length;
    }

    function updateNode(string n, string r, string p, string e, string ip, string id) public {

        nodes[e].publickey = p;
        nodes[e].nodeName = n;
        nodes[e].role = r;
        nodes[e].ip = ip;
        nodes[e].id = id;
        emit print(n, r, p, e, ip, id);
    }

    function getNodeList(uint16 i)  public  constant   returns (string n, string r,string p,string ip,string e, string id) {
        
        NodeDetails memory nodeInfo = nodes[enodeList[i]];
        return (
            nodeInfo.nodeName,
            nodeInfo.role,
            nodeInfo.publickey,
	        nodeInfo.ip,
            enodeList[i],
            nodeInfo.id
        );
    }

}
