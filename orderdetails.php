<?php include("inc/header.php"); ?>
<?php
$login =  Session::get("cuslogin");
if ($login == false) {
    header("Location:login.php");
}
?>
<?php
if (isset($_GET['customerid'])) {
    $id = $_GET['customerid'];
    $time = $_GET['time'];
    $price = $_GET['price'];
    $confirm = $ct->productShiftConfirm($id, $time, $price);
}
?>
<style>
    .tblone tr td {
        text-align: justify;
    }
</style>
<div class="main">
    <div class="content">
        <div class="section group">

            <h2>Your Order Details</h2>
            <table class="tblone">
                <tr>
                    <th>NO</th>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <tr>

                    <?php
                    $cmrId =  Session::get("cmrId");
                    $getOrder = $ct->getOrderedProduct($cmrId);
                    $i = 0;
                    if ($getOrder) {
                        while ($result = $getOrder->fetch_assoc()) {
                            $i++;


                    ?>

                            <td><?php echo $i; ?></td>
                            <td><?php echo $result['productName']; ?></td>
                            <td><img src="admin/<?php echo $result['image']; ?>" alt="" /></td>
                            <td><?php echo $result['quantity']; ?></td>
                            <td>$ <?php echo $result['price']; ?></td>
                            <td><?php echo $fm->formatDate($result['date']); ?></td>
                            <td>
                                <?php
                                if ($result['status'] == '0') {
                                    echo "pending";
                                } elseif ($result['status'] == '1') { ?>
                                    <a href="?customerid=<?php echo $cmrId; ?>&price=<?php echo  $result['price']; ?>&time=<?php echo $result['date']; ?>">Shifted</a>
                                <?php  } else {
                                    echo "Confirm";
                                }
                                ?>
                            </td>
                            <?php
                            if ($result['status'] == '2') { ?>
                                <td><a onclick="return confirm('Are you sure to Delete!'); " href="">X</a></td>
                            <?php } else { ?>
                                <td>N/A</td>
                            <?php  }   ?>
                </tr>

        <?php  }
                    }  //13:15 
        ?>
            </table>
        </div>
    </div>
    <div class="clear"></div>
</div>
</div>
</div>

<?php include("inc/footer.php"); ?>