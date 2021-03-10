pragma solidity ^0.7.4;

contract TextSearch {
    
    //defining wordlist
    struct Wordlists {
        uint index;
        string word;
    }
    
    Wordlists[] wordlist;
    uint public nextId=1;       //see which word is the next

    //Add new word
    function addWord(string memory _inputKeyword) public {
        wordlist.push(Wordlists(nextId,_inputKeyword));
        nextId++;
    }   
    
    //Search ID
    function searchIndex(uint _index) internal view returns(uint){
        for (uint i = 0; i < wordlist.length; i++) {
            if (wordlist[i].index == _index) {
                return i;
            }
        }
    revert("The word doesn't exists!"); //error 
    }
    
    //read index,word associated to ID
    function readKeyword(uint _searchIndex) public view returns(uint, string memory){
        uint i = searchIndex(_searchIndex);
        return (wordlist[i].index,wordlist[i].word);
    }
    
    function updateKeyword(uint _editIndex, string memory _newWord) public returns(uint, string memory){
        uint i = searchIndex(_editIndex);
        wordlist[i].word = _newWord;
    return(wordlist[i].index,wordlist[i].word);
    }
    
    function destroyWord(uint _destroyIndex) public {
        uint i = searchIndex(_destroyIndex);
        delete(wordlist[i]);
    }
    
}
