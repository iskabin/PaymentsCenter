import { DataTable } from "@/components/custom/data-table";
import { columns } from "@/types/payments-type";
import { createFileRoute } from "@tanstack/react-router";
import { useQuery, gql } from "@apollo/client";
import { useEffect, useState } from "react";
import { Combobox, type ComboboxOptions } from "@/components/custom/combobox";
import { LoaderCircle } from "lucide-react";

const GET_PAYMENTS = gql`
  query GetPayments($status: String, $tipo: String) {
    getPayments(status: $status, tipo: $tipo) {
      id
      status
      payableId
      payableType
      value
      payable {
        __typename
        ... on Subscription {
          customerId
          id
          status
          value
          createdAt
          customer {
            name
          }
          items {
            id
            productId
            value
            product {
              name
            }
          }
        }
        ... on Order {
          customerId
          id
          status
          value
          createdAt
          customer {
            name
          }
          items {
            id
            productId
            value
            product {
              name
            }
          }
        }
      }
    }
  }
`;

const statusOptions: ComboboxOptions[] = [
  { value: "paid", label: "Pago" },
  { value: "pending", label: "Pendente" },
  { value: "failed", label: "Falhou" },
];

const chargeTypeOptions: ComboboxOptions[] = [
  { value: "Subscription", label: "Assinatura" },
  { value: "Order", label: "Avulsa" },
];

export const Route = createFileRoute("/")({
  component: Index,
});

function Index() {
  const [filterStatus, setFilterStatus] = useState("");
  const [filterTipo, setFilterTipo] = useState("");

  const { loading, data, refetch }: any = useQuery(GET_PAYMENTS, {
    variables: {
      status: filterStatus,
      tipo: filterTipo,
    },
  });

  useEffect(() => {
    refetch({
      status: filterStatus,
      tipo: filterTipo,
    });
  }, [filterStatus, filterTipo]);

  return (
    <>
      <div className="container mx-auto pt-2 flex">
        <div className="p-8 pl-0">
          <Combobox
            value={filterStatus}
            setValue={setFilterStatus}
            options={statusOptions}
            placeholder="Filtrar por status"
          />
        </div>
        <div className="p-8">
          <Combobox
            value={filterTipo}
            setValue={setFilterTipo}
            options={chargeTypeOptions}
            placeholder="Filtrar por tipo"
          />
        </div>
      </div>
      {loading ? (
        <div className="container mx-auto flex justify-center p-16 animate-spin">
          <LoaderCircle />
        </div>
      ) : (
        <div className="container mx-auto py-10 pt-2">
          <DataTable columns={columns} data={data?.getPayments} />
        </div>
      )}
    </>
  );
}
