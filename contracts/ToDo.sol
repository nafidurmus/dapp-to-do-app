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

  Task[] tasks;

  function createTask(string _content, string _author) public {
    tasks.push(Task(tasks.length, now, _content, _author, false));
  }

  function getTask(uint id) public constant 
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

    //will not work because cant return array of struct yet in Solidity
    //function getTasks() public constant returns(Task[]) {
    //  return tasks;
    //}
}