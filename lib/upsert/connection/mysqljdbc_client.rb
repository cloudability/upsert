class Upsert
  class Connection
    # @private
    class MySQLJdbc_Client < Mysql2_Client
      # Custom implementation of execute method to just proxy to the
      # raw_connection object.
      def execute(sql)
        Upsert.logger.debug { %{[upsert] #{sql}} }
        raw_connection.execute(sql)
      end

      def quote_string(val)
        "'#{val.gsub("'", '')}'"
      end

      def quote_ident(ident)
        "`#{ident.gsub('`', '')}`"
      end
    end
  end
end
