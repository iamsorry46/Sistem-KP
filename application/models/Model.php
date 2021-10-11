<?php 

defined('BASEPATH') OR exit('No direct script access allowed');
                        
class Model extends CI_Model {
                        
public function login(){
                        
                                
}
public function getData($table)
{
    $this->db->from($table);
    return $this->db->get()->result();
    
}
public function updateData($table,$reference,$id,$object)
{
    $this->db->where($reference, $id);
    $this->db->update($table, $object);
}
public function findData($table,$reference,$id)
{
    $this->db->from($table);
    $this->db->where($reference, $id);
    return $this->db->get();
}
                        
                            
                        
}
                        
/* End of file Model.php */
    
                        