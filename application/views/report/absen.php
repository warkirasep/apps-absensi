<div class="row mb-2">
    <h4 class="col-xs-12 col-sm-6 mt-0">Detail Absen</h4>
    <div class="col-xs-12 col-sm-6 ml-auto text-right">
        <form action="" method="get">
            <div class="row">
                <div class="col">
                    <select name="bulan" id="bulan" class="form-control">
                        <option value="" disabled selected>-- Pilih Bulan --</option>
                        <?php foreach($all_bulan as $bn => $bt): ?>
                            <option value="<?= $bn ?>" <?= ($bn == $bulan) ? 'selected' : '' ?>><?= $bt ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
			        <div class="col ">
                    <select name="tahun" id="tahun" class="form-control">
                        <option value="" disabled selected>-- Pilih Tahun</option>
                        <?php for($i = date('Y'); $i >= (date('Y') - 5); $i--): ?>
                            <option value="<?= $i ?>" <?= ($i == $tahun) ? 'selected' : '' ?>><?= $i ?></option>
                        <?php endfor; ?>
                    </select>
                </div>
                <div class="col ">
                    <button type="submit" class="btn btn-primary btn-fill btn-block">Tampilkan</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header border-bottom">
                <div class="row">
                    <div class="col-xs-12 col-sm-6">
                        <h4>Keterangan</h4>
                        <table class="table table-bordered">
                            <tr>
                                <td>H = Hadir</td>
                                <td>L = Libur</td>
                                <td>i = Ijin</td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-xs-12 col-sm-6 ml-auto text-right mb-2">
                        <div class="dropdown d-inline">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="droprop-action" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-print"></i>
                                Export Laporan
                            </button>
                            <div class="dropdown-menu" aria-labelledby="droprop-action">
                                <a href="<?= base_url('absensi/export_pdf/' . $this->uri->segment(3) . "?bulan=$bulan&tahun=$tahun") ?>" class="dropdown-item" target="_blank"><i class="fa fa-file-pdf-o"></i> PDF</a>
                                <a href="<?= base_url('absensi/export_excel/' . $this->uri->segment(3) . "?bulan=$bulan&tahun=$tahun") ?>" class="dropdown-item" target="_blank"><i class="fa fa-file-excel-o"></i> Excel</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
            <div class="card-body">
                <h4 class="card-title mb-4">Absen Bulan : <?= bulan($bulan) . ' ' . $tahun ?></h4>
                <div class="table-responsive" style="overflow-x: auto;">
                    <table class="table table-striped table-bordered" style="white-space:nowrap;">
                        <thead>
                            <tr>
                                <th><strong>Nama</strong></th>
                                <?php foreach($hari as $i => $h): ?>
                                <th><strong><?= date('d', strtotime($h['tgl'])); ?></strong></th>
                                <?php endforeach; ?>
                                <th><strong>Total</strong></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($karyawan as $row): ?>
                            <tr>
                                <td><?php echo $row->nama; ?></td>
                                <?php 
                                    $hadir = 0;
                                    $libur = 0;
                                ?>
                                <?php foreach($hari as $i => $h): ?>
                                    <td>
                                        <?= 
                                            $res = cek_hadir($row->id_user, $h['tgl'], $bulan, $tahun);
                                            if($res == 'H')
                                            {
                                                $hadir++;
                                            } 
                                        ?>
                                    </td>
                                <?php endforeach; ?>
                                <td><?php echo $hadir; ?></td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
