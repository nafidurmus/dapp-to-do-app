pragma solidity ^0.4.22;
//pragma experimental ABIEncoderV2; // ParsedContract.sol:36:2: ParserError: Expected pragma, import directive or contract/interface/library definition.


contract ToDo {
  struct Task {
    uint id;
    uint date;
    string content;
    string author;
    bool done;
  }

  //Task[] tasks; daha az gas için aşağıdakini kullandık
  uint lastTaskId;
  uint[] taskIds; //dinamik array
  mapping (uint => Task) tasks;

  event TaskCreated(uint, uint, string, string , bool);
  

  function ToDo () public {
  	lastTaskId = 0;
  }
  
  

  function createTask(string _content, string _author) public {
  	lastTaskId++;
    tasks[lastTaskId] = Task(lastTaskId, now, _content, _author, false);
    taskIds.push(lastTaskId);
    TaskCreated(lastTaskId, now, _content, _author, false),
    
  }

  function getTaskIds () public constant returns(uint[]) {
  	return taskIds;
  	
  }
  

  function getTask(uint id) tasksExists(id) public constant 
    returns(
      uint,
      uint,
      string,
      string,
      bool
    ) {
      return(
        id,
        tasks[id].date,
        tasks[id].content,
        tasks[id].author,
        tasks[id].done
      );
    }


    modifier tasksExists(uint id) { 
    	if(tasks[id].id == 0){
    		revert();
    	} 
    	_;
    }
    
}