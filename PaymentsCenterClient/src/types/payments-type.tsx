import { Chip } from "@/components/custom/chip";
import type { ColumnDef } from "@tanstack/react-table";

export type Payment = {
  id: string;
  customer: string;
  products: string[];
  value: number;
  status: string;
  date: Date;
  payableType: string;
  payable: any;
};

export const columns: ColumnDef<Payment>[] = [
  {
    accessorKey: "id",
    header: "ID",
  },
  {
    accessorKey: "customer",
    header: "Cliente",
    cell: ({ row }) => row?.original?.payable?.customer?.name,
  },
  {
    accessorKey: "products",
    header: "Produtos",
    cell: ({ row }) => {
      const products = row?.original?.payable?.items;
      return products?.map((p: any, index: number) =>
        index === products?.length - 1
          ? p?.product?.name
          : p?.product?.name + ", "
      );
    },
  },
  {
    accessorKey: "value",
    header: "Valor",
    cell: ({ row }) => {
      const value: number = row?.getValue("value");
      const formatted = new Intl.NumberFormat("pt-BR", {
        style: "currency",
        currency: "BRL",
      }).format(value / 100);

      return <div className="text-right">{formatted}</div>;
    },
  },
  {
    accessorKey: "status",
    header: "Status",
    cell: ({ row }) => {
      const status: string = row?.getValue("status");
      let statusType: "default" | "success" | "danger";
      status == "paid"
        ? (statusType = "success")
        : status == "failed"
          ? (statusType = "danger")
          : (statusType = "default");
      return <Chip text={status} type={statusType} />;
    },
  },
  {
    accessorKey: "date",
    header: "Data",
    cell: ({ row }) => {
      const date: Date = row?.getValue("date");
      const formatted = new Intl.DateTimeFormat("pt-BR").format(date);

      return <div className="text-center">{formatted}</div>;
    },
  },
  {
    accessorKey: "payableType",
    header: "Tipo de cobrança",
    cell: ({ row }) => {
      const payableType: string = row?.getValue("payableType");

      return <>{payableType?.toUpperCase()}</>;
    },
  },
];
