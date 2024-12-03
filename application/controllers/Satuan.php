<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Satuan extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        cek_login();

        $this->load->model('Admin_model', 'admin');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $data['title'] = "Goods Unit";
        $data['satuan'] = $this->admin->get('satuan');
        $this->template->load('templates/dashboard', 'satuan/data', $data);
    }

    private function _validasi()
    {
        $this->form_validation->set_rules('nama_satuan', 'Nama Satuan', 'required|trim');
    }

    public function add()
    {
        $this->_validasi();

        if ($this->form_validation->run() == false) {
            $data['title'] = "Goods Unit";
            $this->template->load('templates/dashboard', 'satuan/add', $data);
        } else {
            $input = $this->input->post(null, true);
            $insert = $this->admin->insert('satuan', $input);
            if ($insert) {
                set_pesan('Data Saved');
                redirect('satuan');
            } else {
                set_pesan('Data Failed To Save', false);
                redirect('satuan/add');
            }
        }
    }

    public function edit($getId)
    {
        $id = encode_php_tags($getId);
        $this->_validasi();

        if ($this->form_validation->run() == false) {
            $data['title'] = "Goods Unit";
            $data['satuan'] = $this->admin->get('satuan', ['id_satuan' => $id]);
            $this->template->load('templates/dashboard', 'satuan/edit', $data);
        } else {
            $input = $this->input->post(null, true);
            $update = $this->admin->update('satuan', 'id_satuan', $id, $input);
            if ($update) {
                set_pesan('Data Saved');
                redirect('satuan');
            } else {
                set_pesan('Something went wrong', false);
                redirect('satuan/add');
            }
        }
    }

    public function delete($getId)
    {
        $id = encode_php_tags($getId);
        if ($this->admin->delete('satuan', 'id_satuan', $id)) {
            set_pesan('Requested data has been deleted');
        } else {
            set_pesan('Something went wrong', false);
        }
        redirect('satuan');
    }
}
