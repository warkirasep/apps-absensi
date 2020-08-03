<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Absen bulan <?= bulan($bulan) . ', ' . $tahun ?></title>

    <link rel="stylesheet" href="<?= base_url('assets/css/bootstrap.min.css') ?>">
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        table, th, td {
            border: 1px solid black;
            padding: 1px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="row mt-2">
        <div class="mt-2">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title mb-4">Absen Bulan : <?= bulan($bulan) . ' ' . $tahun ?></h4>
                            <div class="table-responsive">
                                <table>
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
                                                <?php 
                                                    $res = cek_hadir($row->id_user, $h['tgl'], $bulan, $tahun);
                                                    if($res == 'H')
                                                    {
                                                        $hadir++;
                                                        echo '<td style="background: green;">H</td>';
                                                    }elseif($res == 'A'){
                                                        echo '<td style="background: red;">A</td>';
                                                    }else {
                                                        echo '<td style="background: white;">L</td>';
                                                    } 
                                                ?>
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
            <div class="row">
                <div class="col-2">
                    <div class="card">
                        <div class="card-body">
                            <h4>Keterangan :</h4>
                            <table>
                                <tr>
                                    <td>H</td>
                                    <td>:</td>
                                    <td>Hadir</td>
                                </tr>
                                <tr>
                                    <td>A</td>
                                    <td>:</td>
                                    <td>Alpa</td>
                                </tr>
                                <tr>
                                    <td>L</td>
                                    <td>:</td>
                                    <td>Libur</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>