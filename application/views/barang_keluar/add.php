<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card shadow-sm border-bottom-primary">
            <div class="card-header bg-white py-3">
                <div class="row">
                    <div class="col">
                        <h4 class="h5 align-middle m-0 font-weight-bold text-primary">
                            Enter Multiple Out-Going Goods
                        </h4>
                    </div>
                    <div class="col-auto">
                        <a href="<?= base_url('barangkeluar') ?>" class="btn btn-sm btn-secondary btn-icon-split">
                            <span class="icon">
                                <i class="fa fa-arrow-left"></i>
                            </span>
                            <span class="text">
                                Back
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <?= $this->session->flashdata('pesan'); ?>
                <form action="<?php echo base_url('barangkeluar/add_to_cart'); ?>" method="post">
                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>">
                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="barang_id">Goods</label>
                    <div class="col-md-5">
                        <div class="input-group">
                            <select name="barang_id" id="barang_id" class="custom-select">
                                <option value="" selected disabled>Please Select..</option>
                                <?php foreach ($barang as $b) : ?>
                                    <option value="<?= $b['id_barang'] ?>"><?= $b['id_barang'] . ' | ' . $b['nama_barang'] ?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="input-group-append">
                                <a class="btn btn-primary" href="<?= base_url('barang/add'); ?>"><i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                        <?= form_error('barang_id', '<small class="text-danger">', '</small>'); ?>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="harga">Price</label>
                    <div class="col-md-5">
                        <input readonly="readonly" id="harga" name="harga" type="number" class="form-control">
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="stok">Stock</label>
                    <div class="col-md-5">
                        <input readonly="readonly" id="stok" name="stok" type="number" class="form-control">
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="jumlah_keluar">Out-Going Number</label>
                    <div class="col-md-5">
                        <div class="input-group">
                            <input value="<?= set_value('jumlah_keluar'); ?>" name="jumlah_keluar" id="jumlah_keluar" type="number" min="0" value="0" step="0.1" class="form-control" placeholder="Out-Going Number">
                            <div class="input-group-append">
                                <span class="input-group-text" id="satuan">Units</span>
                            </div>
                        </div>
                        <?= form_error('jumlah_keluar', '<small class="text-danger">', '</small>'); ?>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="total_stok">Total Stock</label>
                    <div class="col-md-5">
                        <input readonly="readonly" id="total_stok" type="number" class="form-control">
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="total_nominal">Total</label>
                    <div class="col-md-5">
                        <div class="input-group">
                        <div class="input-group-append">
                            <span class="input-group-text">$</span>
                        </div>
                        <input readonly="readonly" name="total_nominal" id="total_nominal" type="number" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col offset-md-4">
                        <button type="submit" class="btn btn-primary btn-sm btn-icon-split">
                            <span class="icon">
                                <i class="fa fa-arrow-down"></i>
                            </span>
                            <span class="text">
                                Proceed
                            </span>
                        </button>
                    </div>
                </div>
                <table class="table table-hover table-bordered" style="font-size:12px;margin-top:10px;">
                <thead>
                    <tr>
                        <th style="text-align:center;">Goods</th>
                        <th style="text-align:center;">Price</th>
                        <th style="text-align:center;">Quantity</th>
                        <th style="text-align:center;">Sub Total</th>
                        <th style="width:100px;text-align:center;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1; ?>
                    <?php foreach ($this->cart->contents() as $items): ?>
                    <?php echo form_hidden($i.'[rowid]', $items['rowid']); ?>
                    <tr>
                         <td style="text-align:center;"><?=$items['id'];?> | <?=$items['name'];?></td>
                         <td style="text-align:center;"><?php echo '$'.number_format($items['amount']);?></td>
                         <td style="text-align:center;"><?php echo number_format($items['qty'],1);?></td>
                         <td style="text-align:center;"><?php echo '$'.number_format($items['subtotal']);?></td>
                        
                         <td style="text-align:center;"><a href="<?php echo base_url().'Barangkeluar/remove/'.$items['rowid'];?>" class="btn btn-danger btn-sm"> Cancel</a></td>
                    </tr>
                    
                    <?php $i++; ?>
                    <?php endforeach; ?>
                </tbody>
                </table>
                </form>
            </div>

            <div class="card-header bg-white py-3">
                <div class="row">
                    <div class="col">
                        <h4 class="h5 align-middle m-0 font-weight-bold text-primary">
                            Out-Going Goods Form - Additional Details
                        </h4>
                    </div>
                    <div class="col-auto">
                    </div>
                </div>
            </div>
            <div class="card-body">
            <!-- <?= form_open('', [], ['id_barang_keluar' => $id_barang_keluar, 'user_id' => $this->session->userdata('login_session')['user']]); ?> -->
            <form action="<?php echo base_url('barangkeluar/add'); ?>" method="post">
            <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>">
            <input type="hidden" name="id_barang_keluar" value="<?php echo $id_barang_keluar; ?>">
            <input type="hidden" name="user_id" value="<?php echo $this->session->userdata('login_session')['user']; ?>">
                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="id_barang_keluar">ID OGT</label>
                    <div class="col-md-4">
                        <input value="<?= $id_barang_keluar; ?>" type="text" readonly="readonly" class="form-control">
                        <?= form_error('id_barang_keluar', '<small class="text-danger">', '</small>'); ?>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="tanggal_keluar">Out-Date</label>
                    <div class="col-md-4">
                        <input value="<?= set_value('tanggal_keluar', date('Y-m-d')); ?>" name="tanggal_keluar" id="tanggal_keluar" type="text" class="form-control date" placeholder="Tanggal Keluar...">
                        <?= form_error('tanggal_keluar', '<small class="text-danger">', '</small>'); ?>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="nama_penerima">Name</label>
                    <div class="col-md-5">
                        <input id="nama_penerima" name="nama_penerima" type="text" class="form-control">
                        <?= form_error('nama_penerima', '<small class="text-danger">', '</small>'); ?>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="alamat">Address</label>
                    <div class="col-md-5">
                        <input id="alamat" name="alamat" type="text" class="form-control">
                        <?= form_error('alamat', '<small class="text-danger">', '</small>'); ?>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="diskon">Discount</label>
                    <div class="col-md-5">
                        <div class="input-group">
                            <div class="input-group-append">
                                <span class="input-group-text">$</span>
                            </div>
                            <input name="diskon" id="diskon" type="number" class="form-control" min="1" max="999999999" maxlength="9" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);">
                            <?= form_error('diskon', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="total_nominal">Total</label>
                    <div class="col-md-5">
                        <div class="input-group">
                            <div class="input-group-append">
                                <span class="input-group-text">$</span>
                            </div>
                            <input readonly="readonly" name="total_nominal" id="total_nominal_cart" value="<?php echo $this->cart->total();?>" type="number" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="col-md-4 text-md-right" for="grand_total">Total (After Discount)</label>
                    <div class="col-md-5">
                        <div class="input-group">
                        <div class="input-group-append">
                            <span class="input-group-text">$</span>
                        </div>
                        <input readonly="readonly" name="grand_total" id="grand_total" placeholder="<?php echo $this->cart->total();?>" type="number" class="form-control">
                        <input name="grand_total_hidden" value="<?php echo $this->cart->total();?>" type="hidden" class="form-control">
                        </div>
                    </div>

                </div>

                 
                <div class="row form-group">
                    <div class="col offset-md-4">
                        <button type="submit" class="btn btn-success">Save</button>
                        <button type="reset" class="btn btn-danger">Reset</button>
                    </div>
                </div>
                </form>
                <!-- <?= form_close(); ?> -->
            </div>

        </div>
    </div>
</div>

<!-- Menghilangkan panah di form type number -->
<style type="text/css">
/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
</style>